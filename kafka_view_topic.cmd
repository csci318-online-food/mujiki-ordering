@echo off
cd %~dp0

if "%~1"=="" (
    echo Please specify a topic!
    exit /b 1
)

%~dp0\.kafka\bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic %1 --from-beginning
