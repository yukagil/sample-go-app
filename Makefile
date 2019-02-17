GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
BINARY_NANE = go_server

run: $(GOFILES)
	@go build -o $(BINARY_NANE) ./...
	@./$(BINARY_NANE)

build-linux: $(GOFILES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $(BINARY_NANE) -v

test:
	@go test -v ./...

clean:
	@go clean
	@rm -f $(BINARY_NANE)