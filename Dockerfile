FROM golang:1.11-alpine as build-env
ADD . /go/src/go-server
RUN go install go-server

FROM alpine:3.9
COPY --from=build-env /go/bin/go-server .
ENV PORT 8080
CMD ["./go-server"]