package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
)

type issue struct {
	Comments      int
	HTMLURL       string      `json:"html_url"`
	PullRequest   pullRequest `json:"pull_request"`
	RepositoryURL string      `json:"repository_url"`
	State         string
	Status        status
	Title         string
}

type pullRequest struct {
	Head struct {
		Sha string
	}
	URL string
}

type status struct {
	State string
}

func getData(target interface{}, url string) error {
	resp, err := http.Get(url + "?access_token=" + githubKey)

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	return json.NewDecoder(resp.Body).Decode(target)
}

func color(result string) string {
	if result == "success" {
		return "green"
	} else if result == "pending" {
		return "orange"
	} else {
		return "red"
	}
}

var githubKey = os.Getenv("GITHUB_ACCESS_TOKEN")

func main() {
	issues := new([]issue)

	getData(issues, "https://api.github.com/issues")

	fmt.Println("GitHub")
	fmt.Println("---")
	fmt.Println("Pull Requests | size=16 href=https://github.com/pulls")

	for _, issue := range *issues {
		if issue.PullRequest.URL != "" && issue.State == "open" {
			getData(&issue.PullRequest, issue.PullRequest.URL)
			getData(&issue.Status, issue.RepositoryURL+"/commits/"+issue.PullRequest.Head.Sha+"/status")

			fmt.Printf("(%d) %s | color=%s href=%s size=12\n", issue.Comments, issue.Title, color(issue.Status.State), issue.HTMLURL)
		}
	}
}
