package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
)

type environment struct {
	name        string
	branch_name string
}

func getData(target interface{}, url string) error {
	client := new(http.Client)

	req, err := http.NewRequest("GET", url, nil)

	req.Header.Add("X-Api-Token", deploybotToken)

	if err != nil {
		log.Fatal(err)
	}

	resp, err := client.Do(req)

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	return json.NewDecoder(resp.Body).Decode(target)
}

var deploybotSubdomain = os.Getenv("DEPLOYBOT_SUBDOMAIN")
var deploybotToken = os.Getenv("DEPLOYBOT_TOKEN")

func main() {
	environments := new([]environment)

	getData(environments, "https://"+deployBotSubdomain+".deploybot.com/api/v1/environments")
}
