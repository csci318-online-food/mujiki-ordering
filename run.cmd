@echo off
for /d %%x in (*-service) do (
    cd %%x
    cmd /c "mvnw.cmd spring-boot:run"
    cd ..
)
