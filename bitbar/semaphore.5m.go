package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"sort"
	"time"
)

type project struct {
	Branches []branch
	HTMLURL  string `json:"html_url"`
	Name     string
	Owner    string
}

type branch struct {
	BranchName string `json:"branch_name"`
	BuildURL   string `json:"build_url"`
	Commit     commit
	Result     string
	StartedAt  string `json:"started_at"`
}

func (b branch) Date() time.Time {
	ts, err := time.Parse(time.RFC3339, b.StartedAt)

	if err != nil {
		// If there is no timestamp, it hasn't started yet. Place it at
		// the top.
		return time.Now()
	}

	return ts
}

type commit struct {
	AuthorName string `json:"author_name"`
}

func getProjects(target interface{}) error {
	apiKey := os.Getenv("SEMAPHORE_CI_AUTH_TOKEN")
	resp, err := http.Get("https://semaphoreci.com/api/v1/projects?auth_token=" + apiKey)

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	return json.NewDecoder(resp.Body).Decode(target)
}

func authoredBranches(branches []branch) []branch {
	ret := []branch{}

	for _, branch := range branches {
		if branch.Commit.AuthorName == "James Newton" {
			ret = append(ret, branch)
		}
	}

	return ret
}

func slicedBranches(branches []branch) []branch {
	if len(branches) > 10 {
		return branches[:10]
	}

	return branches
}

func status(result string) string {
	if result == "passed" {
		return "green"
	} else if result == "pending" {
		return "orange"
	} else {
		return "red"
	}
}

func main() {
	projects := new([]project)

	err := getProjects(projects)

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Semaphore CI")
	fmt.Println("---")

	for _, project := range *projects {
		fmt.Printf("%s/%s | href=%s\n", project.Owner, project.Name, project.HTMLURL)

		myBranches := authoredBranches(project.Branches)

		sort.Slice(myBranches, func(i, j int) bool {
			return myBranches[j].Date().Before(myBranches[i].Date())
		})

		for _, branch := range slicedBranches(myBranches) {
			fmt.Printf("%s | color=%s href=%s\n", branch.BranchName, status(branch.Result), branch.BuildURL)
		}

		fmt.Println("---")
	}
}
