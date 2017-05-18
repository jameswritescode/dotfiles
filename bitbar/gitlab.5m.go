package main

import "fmt"

var gitlabKey = os.Getenv("GITLAB_ACCESS_TOKEN")

func getData(target interface{}, url string) error {
	resp, err := http.Get(url + "?access_token=" + gitlabKey)

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	return json.NewDecoder(resp.Body).Decode(target)
}

func main() {
	fmt.Println("GitLab")
	fmt.Println("---")
}
