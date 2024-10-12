#!/bin/bash
ls -d *-service/ | xargs -P 1000 -I {} bash -c "cd '{}' && ./mvnw spring-boot:run"
