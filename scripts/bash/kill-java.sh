#!/bin/bash

ps -ef | grep java | cut -d ' ' -f 4 | xargs kill
