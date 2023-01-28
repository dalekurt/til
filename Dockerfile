FROM python:3.10.0-alpine3.14 as build

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /build

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apk -U upgrade \
  && apk add --no-cache gcc musl-dev libffi-dev openssl-dev git git-fast-import graphviz \
  && rm -rf /var/cache/apk/* \
  && pip install --upgrade pip \
  && pip install --no-cache-dir poetry

COPY pyproject.toml .
COPY poetry.lock .

RUN poetry export -f requirements.txt --without-hashes | sed 's/-e //' >> /tmp/requirements.txt \
  && pip install --no-cache-dir -r /tmp/requirements.txt

COPY mkdocs.yml mkdocs.yml
COPY docs docs
COPY overrides overrides
COPY .git .git

RUN mkdocs build --strict

FROM nginx:stable-alpine as release
COPY --from=build /build/site/ /usr/share/nginx/html/
EXPOSE 8080
