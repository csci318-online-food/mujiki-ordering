@echo off
for /d %%x in (*-service) do (
    cd %%x
    start cmd /c "mvnw.cmd spring-boot:run"
    cd ..
)
