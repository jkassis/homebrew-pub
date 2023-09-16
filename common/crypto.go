package common

import (
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"io"
	"log"
	"net/http"
)

func URLToSha(url string) string {
	client := http.Client{
		CheckRedirect: func(r *http.Request, via []*http.Request) error {
			r.URL.Opaque = r.URL.Path
			return nil
		},
	}
	// Put content on file
	resp, err := client.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	buffer := bytes.NewBuffer(nil)
	_, err = io.Copy(buffer, resp.Body)
	if err != nil {
		panic(err)
	}

	hasher := sha256.New()
	hasher.Write(buffer.Bytes())
	if err != nil {
		log.Fatal(err)
	}

	return hex.EncodeToString(hasher.Sum(nil))
}
