To activate any of the plugins:

```
$ go build -o enabled/NAME.cgo NAME.go
```

To set environment variables they should read:

```
$ launchctl setenv NAME VALUE
```

Relevant environment names:

* `GITHUB_ACCESS_TOKEN`
* `GITLAB_ACCESS_TOKEN`
* `SEMAPHORE_CI_AUTH_TOKEN`
* `TWITCH_API_KEY`
