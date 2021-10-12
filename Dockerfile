FROM golang:1.17.2 as builder
WORKDIR /go/src/app
COPY . .
#RUN GOOS=linux go build -ldflags="-s -w"
RUN go build /go/src/app/main.go

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app/main .

CMD ["./main"]
