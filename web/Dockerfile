# Luraph Deobfuscator — web app image.
#
# Build from the REPO ROOT (the image needs the engine, core/, src/ and the
# prebuilt bin/luau alongside the web/ app):
#
#     docker build -f web/Dockerfile -t luraph-deob .
#     docker run -p 8080:8080 luraph-deob
#
# bin/luau and bin/luau-ast are statically linked x86-64 ELF binaries, so no
# libc or extra runtime is needed beyond Node and Python.

FROM node:22-slim

# Python 3 is the devirtualization engine's runtime (stdlib only, no pip deps).
RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install web dependencies first so this layer caches across code changes.
COPY web/package.json web/package-lock.json* ./web/
RUN cd web && npm install --omit=dev --no-audit --no-fund

# Copy the whole project (engine + web). .dockerignore keeps node_modules,
# .git, caches and Windows binaries out so the installed deps above survive.
COPY . .

# The luau binaries are tracked but may lose the execute bit over a checkout.
RUN chmod +x bin/luau bin/luau-ast

ENV NODE_ENV=production \
    PORT=8080 \
    PYTHON_BIN=python3

EXPOSE 8080

# Run as the unprivileged user that ships with the node image.
USER node

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD node -e "fetch('http://127.0.0.1:'+ (process.env.PORT||8080) +'/api/health').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"

CMD ["node", "web/backend/server.js"]
