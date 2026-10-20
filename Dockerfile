FROM alpine
ARG TARGETPLATFORM
LABEL name=ddns-go
LABEL url=https://github.com/liuyie/ddns-go
RUN apk add --no-cache curl grep
WORKDIR /app
COPY ${TARGETPLATFORM}/ddns-go /app/
COPY zoneinfo /usr/share/zoneinfo
ENV TZ=Asia/Shanghai
EXPOSE 9876
ENTRYPOINT ["/app/ddns-go"]
CMD ["-l", ":9876", "-f", "300"]
