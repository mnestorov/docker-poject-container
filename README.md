# Docker - Project Container with PHP 8+ and Apache

[![CircleCI](https://circleci.com/gh/adrian-gheorghe/docker-setup.svg?style=svg)](https://circleci.com/gh/adrian-gheorghe/docker-setup)

## Introduction

This repository provides a Docker setup for a project container featuring PHP 8+ and Apache. The provided Dockerfile includes necessary PHP extensions and configurations to create an environment suitable for hosting PHP-based projects.

## Dockerfile

The `Dockerfile` in this repository contains all the PHP extensions and configurations required for the project container.

## Project Container Management

To manage the project container, the following commands are available:

**Build container:**

```bash
bin/build
```

**Start container:**

```bash
bin/start
```

**Stop container:**

```bash
bin/stop
```

## Project Folder Location

By default, the Laravel project must be placed in the `src` folder. You have the flexibility to modify this location by editing the `docker-compose.yml` file.

## Accessing the Project Container

To enter the project container's shell environment, use the following command:

```bash
bin/shell
```

## Registering SSL Certificates

When working with SSL certificates, follow these steps:

1. Navigate to the `WebServer` directory where your project is located.

2. Generate SSL certificates with the following command. Include all the app addresses that will use the certificate:

   ```bash
   mkcert -cert-file ./docker_files/cert -key-file ./docker_files/cert-key portainer.localhost traefik.localhost app1.localhost app2.localhost
   ```

   Make sure to replace `app1.localhost` and `app2.localhost` with the actual addresses of your apps.

3. After generating the certificates, update your app configurations to use these SSL certificates for secure communication.

## Acknowledgments

This Docker setup streamlines the process of creating a project container with PHP 8+ and Apache. By providing a standardized environment, it helps developers focus on their projects without worrying about the underlying infrastructure.
