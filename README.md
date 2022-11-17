# Offline Docker Ansible Role

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine/)

Install Docker into air-gapped and offline environments. The roles is closely follows [official instructions](https://docs.docker.com/engine/install/ubuntu/#install-from-a-package).

## Requirements

- Requires Docker deb installation files somewhere on the local computer. See example how to specify

## Role Variables

Check `defaults/main.yml` for all variables.

## How to use

1. Install

```sh
ansible-galaxy install chaliy.offline_docker
```

2. Download Docker deb files from Docker website - (https://docs.docker.com/engine/install/ubuntu/#install-from-a-package)[instructions] and put them somewhere on the local computer. For example:

```sh
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/containerd.io_1.6.9-1_arm64.deb -P ./.offline/docker
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/docker-ce-cli_20.10.21~3-0~ubuntu-jammy_arm64.deb -P ./.offline/docker
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/docker-ce-rootless-extras_20.10.21~3-0~ubuntu-jammy_arm64.deb -P ./.offline/docker
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/docker-ce_20.10.21~3-0~ubuntu-jammy_arm64.deb -P ./.offline/docker
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/docker-compose-plugin_2.6.0~ubuntu-jammy_arm64.deb -P ./.offline/docker
```

3. Specify `docker_deb_files` in your playbook
4. Run playbook

NOTE: [offline-playbook.yml](./hacks/offline-playbook.yml) is an example playbook that downloads Docker offline

## Example Playbook

```yaml
- hosts: all
  roles:
  - role: chaliy.offline_docker
    vars:
      # Please note, order of deps is important
      docker_deb_files:
        - ./.offline/docker/containerd.io_1.6.9-1_arm64.deb
        - ./.offline/docker/docker-ce-cli_20.10.21~3-0~ubuntu-jammy_arm64.deb
        - ./.offline/docker/docker-ce-rootless-extras_20.10.21~3-0~ubuntu-jammy_arm64.deb
        - ./.offline/docker/docker-ce_20.10.21~3-0~ubuntu-jammy_arm64.deb
        - ./.offline/docker/docker-compose-plugin_2.6.0~ubuntu-jammy_arm64.deb
```

## Development

```sh
poetry install
make test
```

## License

MIT (Except russians)
