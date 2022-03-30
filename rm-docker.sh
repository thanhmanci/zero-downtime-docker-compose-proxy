docker rm -f $(docker ps --all -q -f status=exited)
