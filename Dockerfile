FROM golang:1.17.7-alpine3.15 as dev

WORKDIR $GOPATH/src

COPY . .

EXPOSE 8080

RUN go build

CMD ["./go-web-server"]