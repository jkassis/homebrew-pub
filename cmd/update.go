package cmd

import (
	"bufio"
	"context"
	"fmt"
	"log"
	"os"
	"strings"
	"syscall"

	"github.com/google/go-github/github"
	"github.com/jkassis/dist.brew.pub/common"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"golang.org/x/term"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

// updateCmd represents the update command
var UpdateCmd = &cobra.Command{
	Use:   "update",
	Short: "Update all Formulae",
	Long: `
update works through the formula in formula.yaml and prepares the formula files
in the Formula dir.`,
	Run: func(cmd *cobra.Command, args []string) {
		doIt(cmd)
		fmt.Println("update called")
	},
}

func doIt(cmd *cobra.Command) {
	ctx := cmd.Context()
	log := common.LoggerFromContext(ctx)

	var client *github.Client

	v := ctx.Value("viper").(*viper.Viper)
	authPrompt := v.GetBool("auth_prompt")
	if authPrompt {
		r := bufio.NewReader(os.Stdin)
		fmt.Print("GitHub Username: ")
		username, _ := r.ReadString('\n')

		fmt.Print("GitHub Password: ")
		bytePassword, _ := term.ReadPassword(syscall.Stdin)
		password := string(bytePassword)

		tp := github.BasicAuthTransport{
			Username: strings.TrimSpace(username),
			Password: strings.TrimSpace(password),
		}
		client = github.NewClient(tp.Client())
		fmt.Print("\n")
	} else {
		client = github.NewClient(nil)
	}

	// Iterate through the formulas
	formulas := common.GetFormulas("formulas.yaml")
	for _, formula := range formulas {
		// Get the releases for the formula
		release, _, err := client.Repositories.GetLatestRelease(context.Background(), formula.Owner, formula.Repo)
		log.Infof("processing %s %s", formula.Name, *release.TagName)
		for _, asset := range release.Assets {
			log.Infof("   %s", asset.GetBrowserDownloadURL())
		}
		if err != nil {
			log.Errorf("could not get latest release for %s: %v", formula.Name, err)
		}
		writeFormula(formula, release)
	}
}

// See https://docs.brew.sh/Formula-Cookbook
func writeFormula(formula *common.Formula, release *github.RepositoryRelease) {
	file, err := os.Create(fmt.Sprintf("Formula/%s.rb", formula.Name))
	if err != nil {
		log.Fatalf("could not open formula file: %v", err)
	}
	defer func() {
		file.Sync()
		file.Close()
	}()

	caser := cases.Title(language.English)

	file.WriteString(fmt.Sprintf(`
	class %s < Formula
		desc ""
		homepage "%s"
		version "%s"

	`, caser.String(formula.Name), formula.Homepage, *release.TagName))

	{
		file.WriteString("  on_macos do\n")
		writeFormulaEntry(
			file,
			"Hardware::CPU.intel? && Hardware::CPU.is_64_bit?",
			func(an common.AssetName) bool {
				return an.IsBrew() && an.IsMac() && an.IsIntel() && an.Is64Bit()
			},
			formula,
			release)

		writeFormulaEntry(
			file,
			"Hardware::CPU.arm? && Hardware::CPU.is_64_bit?",
			func(an common.AssetName) bool {
				return an.IsBrew() && an.IsMac() && an.IsArm() && an.Is64Bit()
			},
			formula,
			release)
		file.WriteString("\n  end\n")
	}

	{
		file.WriteString("\n  on_linux do\n")

		writeFormulaEntry(file,
			"Hardware::CPU.intel? && Hardware::CPU.is_64_bit?",
			func(an common.AssetName) bool {
				return an.IsBrew() && an.IsLinux() && an.IsIntel() && an.Is64Bit()
			},
			formula,
			release)

		writeFormulaEntry(file,
			"Hardware::CPU.arm? && Hardware::CPU.is_64_bit?",
			func(an common.AssetName) bool {
				return an.IsBrew() && an.IsLinux() && an.IsArm() && an.Is64Bit()
			},
			formula,
			release)

		file.WriteString("\n  end\n")
	}
	file.WriteString("end\n")
}

func writeFormulaEntry(f *os.File, rbCond string, cond func(common.AssetName) bool, formula *common.Formula, release *github.RepositoryRelease) {
	for _, asset := range release.Assets {
		if cond(common.AssetName(asset.GetBrowserDownloadURL())) {
			fileStuff := `
    if %s
      url "%s"
      sha256 "%s"

      def install
			  libexec.install Dir["/"]
				bin.write_exec_script libexec/"bin/%s"
      end
    end
`
			// packageName := common.AssetName(*asset.Name).PackageName()
			f.WriteString(fmt.Sprintf(fileStuff, rbCond, asset.GetBrowserDownloadURL(), common.URLToSha(asset.GetBrowserDownloadURL()), formula.Name))
		}
	}
}
