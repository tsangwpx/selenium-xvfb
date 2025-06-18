Build and run in the project root.

```
docker build -t selenium-xvfb .
docker run --init -it --rm -v $(pwd):/app -p 5900:5900 --name selenium-xvfb selenium-xvfb
```

In another terminal, run the following to open an VNC client to access the chrome in the docker

```
xtightvncviewer 127.0.0.1:5900
```
