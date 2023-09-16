package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/jkassis/dist.brew.pub/cmd"
	"github.com/jkassis/dist.brew.pub/common"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var cfgFile string

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "app",
	Short: "A brief description of your application",
	Long: `A longer description that spans multiple lines and likely contains
examples and usage of using your application. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
}

func main() {
	// logger
	loggerConfig := zap.NewDevelopmentConfig()
	loggerConfig.EncoderConfig.TimeKey = "timestamp"
	loggerConfig.EncoderConfig.EncodeTime = zapcore.TimeEncoderOfLayout(time.RFC3339)
	logger, err := loggerConfig.Build()
	if err != nil {
		log.Fatal(err)
	}
	sugar := logger.Sugar()
	ctx := common.WithLogger(context.Background(), sugar)

	// cobra
	cobra.OnInitialize(initConfig)
	rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is $HOME/.app.yaml)")

	// viper
	v := viper.New()
	rootCmd.PersistentFlags().BoolP("auth_prompt", "p", false, "prompt for github auth")
	v.BindPFlag("auth_prompt", rootCmd.PersistentFlags().Lookup("auth_prompt"))
	ctx = context.WithValue(ctx, "viper", v)

	// commands
	rootCmd.AddCommand(cmd.UpdateCmd)

	// Create a context with the logger
	rootCmd.ExecuteContext(ctx)
}

func initConfig() {
	if cfgFile != "" {
		// Use config file from the flag.
		viper.SetConfigFile(cfgFile)
	} else {
		// Find home directory.
		home, err := os.UserHomeDir()
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		// Search config in home directory with name ".app" (without extension).
		viper.AddConfigPath(home)
		viper.SetConfigName(".app")
	}

	if err := viper.ReadInConfig(); err == nil {
		fmt.Println("Using config file:", viper.ConfigFileUsed())
	}
}
