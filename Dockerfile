FROM golang:1.9-alpine

RUN apk add --no-cache ca-certificates

ADD * /go/

RUN env GOOS=linux GOARCH=amd64 go build .

EXPOSE 9117
WORKDIR /go
ENTRYPOINT ["/go/apache_exporter"]