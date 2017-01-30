# Openresty-dev
A quickstart Openresty / Lua development docker container.

Get up and running like:

```
git clone git@github.com:devopsmakers/openresty-dev.git
cd openresty-dev
docker build -t openresty-dev .
docker run -p 3000:3000 -v ./src:/src openresty-dev
```

You should be able get to localhost:3000 in your browser. All changes to code or
configuration will cause Openresty to reload.

WARNING: Security and performance optimisation have not been considered at all here.

Have fun!!
