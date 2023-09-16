package common

import (
	"fmt"
	"os"

	"gopkg.in/yaml.v2"
)

type Formula struct {
	Name     string `yaml:"name"`
	Owner    string `yaml:"owner"`
	Repo     string `yaml:"repo"`
	Homepage string `yaml:"homepage"`
}

type Formulas struct {
	Formulas []*Formula `yaml:"formulas"`
}

func GetFormulas(path string) []*Formula {
	// Read YAML file
	data, err := os.ReadFile(path)
	if err != nil {
		fmt.Println(err)
	}

	// Unmarshal YAML into struct
	var formulas *Formulas
	err = yaml.Unmarshal(data, &formulas)
	if err != nil {
		fmt.Println(err)
	}

	return formulas.Formulas
}
