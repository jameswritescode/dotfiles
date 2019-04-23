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
	Status        buildStatus
	Title         string
}

type pullRequest struct {
	URL  string
	Head struct {
		Sha string
	}
	Labels []struct {
		Name string
	}
}

func (pr pullRequest) ShowLabel() string {
	var hasLabel = false

	for _, label := range pr.Labels {
		if label.Name == "wip" {
			hasLabel = true
		}
	}

	if hasLabel {
		return "WIP: "
	}

	return ""
}

type buildStatus struct {
	State      string
	TotalCount int `json:"total_count"`
}

func (s buildStatus) Color() string {
	if s.State == "success" || s.TotalCount == 0 {
		return "green"
	} else if s.State == "pending" {
		return "orange"
	} else {
		return "red"
	}
}

func getData(target interface{}, url string) error {
	resp, err := http.Get(url + "?access_token=" + githubKey)

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	return json.NewDecoder(resp.Body).Decode(target)
}

var githubKey = os.Getenv("GITHUB_ACCESS_TOKEN")

func main() {
	issues := new([]issue)

	getData(issues, "https://api.github.com/issues")

	fmt.Println("GitHub")
	fmt.Println("---")
	fmt.Println("Pull Requests | href=https://github.com/pulls")

	for _, issue := range *issues {
		if issue.PullRequest.URL != "" && issue.State == "open" {
			getData(&issue.PullRequest, issue.PullRequest.URL)
			getData(&issue.Status, issue.RepositoryURL+"/commits/"+issue.PullRequest.Head.Sha+"/status")

			fmt.Printf("(%d) %s%s | color=%s href=%s\n", issue.Comments, issue.PullRequest.ShowLabel(), issue.Title, issue.Status.Color(), issue.HTMLURL)
		}
	}
}
