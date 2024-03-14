FROM golang:1.20
ENV PORT 50051
EXPOSE 50051

WORKDIR /go/src/app
COPY . .

ARG GO111MODULE=off
RUN go get -d -v ./...
RUN go build -v -o app ./...
RUN mv ./app /go/bin/

CMD ["app"]