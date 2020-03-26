# Docker SSH Tunnel Image

This image lets you easily set up a SSH tunnel. This is different to [existing solutions on Docker Hub](https://hub.docker.com/r/cagataygurturk/docker-ssh-tunnel/) because it doesn't require any files to be mounted -- all configuration is provided in the environment.

## Usage

```sh
docker run \
  -e SSH_KEY="$(cat ~/.ssh/id_rsa)" \
  -e SSH_HOST=aj@bastion.company.com \
  -e TARGET_HOST=mysql.company.internal \
  -e TARGET_PORT=3306 \
  -p 10000:10000 \
  alexjurkiewicz/ssh-tunnel:latest
```

This will SSH to `SSH_HOST` and set up a tunnel to `TARGET_HOST:TARGET_PORT`. The tunnel will be exposed on port 10000. You can test the tunnel by running this in another terminal window:

```sh
mysql -h localhost -P 10000 # works!
```

## Environment Variables

| Variable | Required? | Description |
| -------- | --------- | ----------- |
| SSH_HOST | **Yes** | SSH host to connect to. Format is `user@host`. |
| SSH_KEY | **Yes** | SSH key to identify with. |
| TARGET_HOST | **Yes** | Tunnel target hostname. |
| TARGET_PORT | **Yes** | Tunnel target port. |
| SSH_EXTRA_OPTS | No | Any extra SSH options, eg `-v -o Ciphers=chacha20-poly1305@openssh.com` |
| SERVER_ALIVE_INTERVAL | No | `ServerAliveInterval` is set to `10` by default (to disconnect within 30 seconds of network interruption), but you can override it here. |
