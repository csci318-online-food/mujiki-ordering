@echo off
set KAFKA_RELEASE=3.7.0
set KAFKA_SCALA_VERSION=2.13

cd %~dp0

REM Check if Kafka exists
if not exist ".kafka" (
    echo Downloading and installing Kafka
    mkdir ".kafka"
    curl -SL https://archive.apache.org/dist/kafka/%KAFKA_RELEASE%/kafka_%KAFKA_SCALA_VERSION%-%KAFKA_RELEASE%.tgz | tar -xz -C ".kafka" --strip-components=1
)

rmdir /s /q %~d0\tmp\zookeeper
rmdir /s /q %~d0\tmp\kafka-logs
rmdir /s /q .kafka\kafka-streams

start cmd /c .kafka\bin\windows\zookeeper-server-start.bat .kafka\config\zookeeper.properties

timeout /t 1 /nobreak > NUL

start cmd /c .kafka\bin\windows\kafka-server-start.bat .kafka\config\server.properties
