package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
)

type Following struct {
	Streams []Stream
}

type Stream struct {
	Channel Channel
	Game    string
	Viewers int
}

type Channel struct {
	DisplayName string `json:"display_name"`
	Url         string `json:"url"`
}

func GetStreaming(target interface{}, twitchKey string) error {
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
	following := new(Following)
	twitchKey := os.Getenv("TWITCH_API_KEY")
	GetStreaming(following, twitchKey)

	fmt.Println("Twitch:", len(following.Streams))
	fmt.Println("---")

	for _, stream := range following.Streams {
		channelUrl := strings.Replace(stream.Channel.Url, "https://www.", "", -1)
		fmt.Printf("%s is playing %s with %d viewing | color=white size=12 terminal=false bash=/usr/local/bin/livestreamer param1=--twitch-oauth-token param2=%s param3=%s param4=best\n",
			stream.Channel.DisplayName, stream.Game, stream.Viewers, twitchKey, channelUrl)
	}
}
