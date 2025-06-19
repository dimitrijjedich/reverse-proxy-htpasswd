# AuthGuard for WebServices
**Lightweight Reverse Proxy with Password Protection**
 
This sleek, Dockerized reverse proxy leverages **nginx** and **htpasswd** to lock down your apps with simple, reliable HTTP Basic Authentication

## Requirements

## Requirements and Setup

![Docker](https://img.shields.io/badge/Docker-grey?logo=docker)
![Docker Compose](https://img.shields.io/badge/Docker%20Compose-grey?logo=docker)

> The target web service should be running on the docker host machine

### Configure the exposed and internal port

Copy the environment template and adjust the Port (`EXPOSED_PORT`) to the one you want to use for the excess to your service (default is 1337):

```bash
cp .env.example .env
```

Adjust the port of the service you want to reach by editing the nginx configuration (`default.conf`) and updating the port in the line:
```
proxy_pass http://host.docker.internal:8000;
```

### 3. Build and start the reverse proxy

```bash
docker-compose up --build -d
```

The service can be later be stopped using 

```bash
docker-compose down
```

or

```bash
docker stop reverse-proxy
```

### 4. Add a user

To add an authorized user, use the provided `creatUser.sh` script:

```bash
./creatUser.sh <username>
```

You’ll be prompted to enter a password for the user.

### 5. Access your secured service

Open your browser and visit (adjusting the port to the one you configured in the `.env`):

```
http://localhost:1337
```

You will be prompted to log in with the username and password you set.
