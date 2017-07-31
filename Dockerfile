FROM golang:1.9-alpine

RUN apk add --no-cache ca-certificates

ADD * /

RUN env GOOS=linux GOARCH=amd64 go build .

EXPOSE 9117
ENTRYPOINT ["/apache_exporter"]