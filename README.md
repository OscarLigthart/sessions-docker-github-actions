# Docker + Gitlab Actions Tutorial

[![Create and publish a Docker image](https://github.com/OscarLigthart/sessions-docker-github-actions/actions/workflows/docker-build-push.yaml/badge.svg)](https://github.com/OscarLigthart/sessions-docker-github-actions/actions/workflows/docker-build-push.yaml)

This repo contains a simple API that uses OpenCV to flip an image.

The goal of this session is to build a Docker container around the API.
By containerizing the API, we can easily ship the code (for instance to someone on a different OS), and run the code in the cloud with minimal waste of resources.

## Usage

For local testing, run the following commands:

```bash
pip install -r requirements.txt
uvicorn app:app
```

This will launch the API and expose it on `localhost:8000`.
