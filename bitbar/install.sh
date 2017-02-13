go build -o enabled/twitch.5m.cgo twitch.5m.go
ln -s $PWD/twitch.5m.go $PWD/enabled/twitch.5m.cgo

go build -o enabled/semaphore.5m.cgo semaphore.5m.go
ln -s $PWD/semaphore.5m.go $PWD/enabled/semaphore.5m.cgo
