FROM alpine:3.5

RUN apk add --no-cache ca-certificates

ADD * /

RUN env GOOS=linux GOARCH=amd64 go build .

EXPOSE 9117
ENTRYPOINT ["/apache_exporter"]