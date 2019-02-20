FROM golang:1.11-alpine as build-base
ENV GO111MODULE=on
WORKDIR /go/src/github.com/yukagil/sample-go-app
COPY go.mod .
COPY go.sum .
RUN apk add --no-cache git
RUN go mod download


FROM build-base as build-env
COPY . .
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o go-server


FROM alpine:3.9
COPY --from=build-env /go/src/github.com/yukagil/sample-go-app/go-server .
ENV PORT 8080
ENTRYPOINT ["./go-server"]