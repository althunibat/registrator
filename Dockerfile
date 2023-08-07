FROM golang:alpine3.18 AS builder
WORKDIR /go/src/github.com/althunibat/registrator/
COPY . .
RUN \
	apk add --no-cache curl git \
	&& curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
	&& CGO_ENABLED=0 go build -ldflags "-s -w \
    -X main.Version=$(cat VERSION)" \
    -a -o bin/registrator .

FROM alpine:3.18.2
RUN apk update --no-cache \
	&& apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/althunibat/registrator/bin/registrator /bin/registrator

ENTRYPOINT ["/bin/registrator"]
