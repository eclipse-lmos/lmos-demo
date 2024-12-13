#!/bin/bash

# SPDX-FileCopyrightText: 2024 Deutsche Telekom AG
#
# SPDX-License-Identifier: Apache-2.0

curl --location 'http://localhost:8081/lmos/runtime/apis/v1/acme/chat/12345/message' \
--header 'x-turn-id: 1234' \
--header 'x-correlation-id: 1234' \
--header 'x-subset: stable' \
--header 'Content-Type: application/json' \
--data '{
    "inputContext": {
        "messages": [
        {
            "role": "user",
            "format": "text",
            "content": "How is the weather in London?"
        }
        ]
    },
    "systemContext": {
        "channelId": "web"
    },
    "userContext": {
        "userId": "user456"
    }
}'