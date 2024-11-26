FROM golang:1.22 AS builder
WORKDIR /go/src/github.com/larkintuckerllc/busybody/cmd/workload
ADD . /go/src/github.com/larkintuckerllc/busybody
RUN CGO_ENABLED=0 GOOS=linux go install .

FROM alpine:latest  
WORKDIR /root
COPY --from=builder /go/bin/workload .
ENTRYPOINT ["/root/workload"]
