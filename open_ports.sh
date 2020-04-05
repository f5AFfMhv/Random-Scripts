#!/bin/bash

# gauti veikiancias tcp sesijas su internetu

sudo netstat -apnt | grep ESTABLISHED | grep -v 127.0.0.1 | awk {'print $5'}




