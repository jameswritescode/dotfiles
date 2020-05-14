package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
)

type following struct {
	Streams []stream
}

type stream struct {
	Channel channel
	Game    string
	Viewers int
}

type channel struct {
	DisplayName string `json:"display_name"`
	URL         string `json:"url"`
}

func getStreaming(target interface{}, twitchKey string) error {
	client := new(http.Client)

	req, err := http.NewRequest("GET", "https://api.twitch.tv/kraken/streams/followed?stream_type=live", nil)
	req.Header.Add("Accept", "application/vnd.twitchtv.v5+json")
	req.Header.Add("Authorization", "OAuth "+twitchKey)

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

func main() {
	following := new(following)
	twitchKey := os.Getenv("TWITCH_API_KEY")
	getStreaming(following, twitchKey)

	fmt.Println("Twitch:", len(following.Streams))
	fmt.Println("---")

	for _, stream := range following.Streams {
		fmt.Printf("%s is playing %s with %d viewing | color=white href=%s\n",
			stream.Channel.DisplayName, stream.Game, stream.Viewers, stream.Channel.URL)
	}
}
