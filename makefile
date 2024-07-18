build:
	go build -o bin/main texty.go

run:
	go run texty.go

brun:
	go build -o bin/main texty.go
	./bin/main