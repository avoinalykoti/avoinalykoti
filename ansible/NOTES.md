

delete everything:
```
docker kill $(docker ps -q) && docker rm -f $(docker ps -a -q) && sudo rm -rf /opt/smarthome
```