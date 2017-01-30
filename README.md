# Openresty-dev
A quickstart Openresty / Lua development docker container.

Get up and running like:

```
git clone git@github.com:devopsmakers/openresty-dev.git
cd openresty-dev
docker build -t openresty-dev .
docker run -p 3000:3000 -v ./src:/src openresty-dev
```

You should be able get to localhost:3000 in your browser. All Lua code changes
take effect without restart as code caching is off.

WARNING: No security or optimisation of any form has been taken into account in
this configuration.

Have fun!!
