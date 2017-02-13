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

type Project struct {
	Branches []Branch
	HTMLURL  string `json:"html_url"`
	Name     string
	Owner    string
}

type Branch struct {
	BranchName string `json:"branch_name"`
	BuildURL   string `json:"build_url"`
	Commit     Commit
	Result     string
	StartedAt  string `json:"started_at"`
}

func (b Branch) Date() time.Time {
	ts, err := time.Parse(time.RFC3339, b.StartedAt)

	if err != nil {
		// If there is no timestamp, it hasn't started yet. Place it at
		// the top.
		return time.Now()
	}

	return ts
}

type Commit struct {
	AuthorName string `json:"author_name"`
}

type BranchesByStartedAt []Branch

func (s BranchesByStartedAt) Len() int {
	return len(s)
}

func (s BranchesByStartedAt) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s BranchesByStartedAt) Less(i, j int) bool {
	return s[j].Date().Before(s[i].Date())
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

func authoredBranches(branches []Branch) []Branch {
	ret := []Branch{}

	for _, branch := range branches {
		if branch.Commit.AuthorName == "James Newton" {
			ret = append(ret, branch)
		}
	}

	return ret
}

func slicedBranches(branches []Branch) []Branch {
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
	projects := new([]Project)

	err := getProjects(projects)

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Semaphore CI")
	fmt.Println("---")

	for _, project := range *projects {
		fmt.Printf("%s/%s | size=16 href=%s\n", project.Owner, project.Name, project.HTMLURL)

		myBranches := authoredBranches(project.Branches)

		sort.Sort(BranchesByStartedAt(myBranches))

		for _, branch := range slicedBranches(myBranches) {
			fmt.Printf("%s | size=12 color=%s href=%s\n", branch.BranchName, status(branch.Result), branch.BuildURL)
		}

		fmt.Println("---")
	}
}
