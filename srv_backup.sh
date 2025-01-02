#!/bin/bash

rsync -avz --progress mj@docker.home.lab:/opt/docker-compose/ /mnt/Archive/docker-compose/
rsync -avz --progress mj@docker.home.lab:/mnt/data/podcasts/ /mnt/Archive/podcasts/
rsync -avz --progress mj@docker.home.lab:/mnt/data/movies/ /mnt/Archive/movies/
rsync -avz --progress mj@docker.home.lab:/mnt/data/tvshows/ /mnt/Archive/tvshows/