package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
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
	req.Header.Add("Accept", "application/vnd.twitchtv.v3+json")
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
		channelURL := strings.Replace(stream.Channel.URL, "https://www.", "", -1)
		fmt.Printf("%s is playing %s with %d viewing | color=white terminal=false bash=/usr/local/bin/livestreamer param1=--twitch-oauth-token param2=%s param3=%s param4=best\n",
			stream.Channel.DisplayName, stream.Game, stream.Viewers, twitchKey, channelURL)
	}
}
