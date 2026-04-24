# ClamAV Docker Image & Kubernetes Example

This repository provides a production-ready ClamAV (antivirus) Docker image, including example configuration for Docker Compose and Kubernetes.

## Disclaimer

This container image and configuration are provided to give you full control over what runs in your cluster. No guarantees are given regarding the correctness, security, or suitability of this ClamAV implementation. Use at your own risk. This project is considered work in progress and may change at any time.

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
