# build the docker image
docker build -t local/chrome:0.0.1 .
# may need to change 25900 or another port
docker run -p 5900:5900 -e VNC_SERVER_PASSWORD=password --user apps --privileged local/chrome:0.0.1
# next will need to download a VNC client to access
# localhost (127.0.0.1) 5900
