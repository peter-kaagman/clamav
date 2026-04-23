# ClamAV Docker Image & Kubernetes Example

This repository provides a production-ready ClamAV (antivirus) Docker image, including example configuration for Docker Compose and Kubernetes.

## Features
- Minimal Dockerfile for ClamAV
- Example `docker-compose.yml` and `Dockerfile`, config in `./clamav/`
- Kubernetes manifests with ConfigMaps for `clamd.conf` and `freshclam.conf`
- Perl test script for TCP scanning

## Usage

### Docker Compose
```sh
docker compose build
docker compose up -d
```

### Kubernetes
```sh
kubectl apply -f clamav-k8s-example.yml
```

### Testing
Use the Perl script `clamav_test.pl` to send a file to clamd via TCP for scanning.

## License
MIT
