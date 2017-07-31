FROM golang:1.9-alpine

RUN apk add --no-cache ca-certificates git

ADD * /go/

RUN go get github.com/prometheus/client_golang/prometheus && \
    go get github.com/sirupsen/logrus && \
    go get gopkg.in/alecthomas/kingpin.v2 && \ 
    env GOOS=linux GOARCH=amd64 go build .

EXPOSE 9117
WORKDIR /go
ENTRYPOINT ["/go/apache_exporter"]