GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
BINARY_NANE = go-server

run: $(GOFILES)
	@go build -o $(BINARY_NANE) ./...
	@./$(BINARY_NANE)

test:
	@go test -v ./...

clean:
	@go clean
	@rm -f $(BINARY_NANE)