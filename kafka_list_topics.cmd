@echo off
cd %~dp0

%~dp0\.kafka\bin\windows\kafka-topics.bat --bootstrap-server=localhost:9092 --list
