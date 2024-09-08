#!/bin/bash
ls -d */ | sudo -E xargs -P 1000 -I {} bash -c "cd '{}' && ./mvnw spring-boot:run"
