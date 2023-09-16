package common

import "strings"

type AssetName string

func (a AssetName) IsMac() bool {
	return strings.Contains(string(a), "darwin")
}

func (a AssetName) IsLinux() bool {
	return strings.Contains(string(a), "linux")
}

func (a AssetName) IsIntel() bool {
	return strings.Contains(string(a), "amd64")
}

func (a AssetName) IsArm() bool {
	return strings.Contains(string(a), "arm64")
}

func (a AssetName) Is64Bit() bool {
	return strings.Contains(string(a), "amd64") ||
		strings.Contains(string(a), "arm64")
}

func (a AssetName) IsBrew() bool {
	return !strings.HasSuffix(string(a), ".rpm") &&
		!strings.HasSuffix(string(a), ".apk") &&
		!strings.HasSuffix(string(a), ".deb")
}

func (a AssetName) PackageName() string {
	indexOf := strings.LastIndex(string(a), ".tar.gz")
	if indexOf > -1 {
		return string(a)[:indexOf]
	}
	return string(a)
}
