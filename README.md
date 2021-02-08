# Load balancing round-robin

## Prerequisite

This example makes use of Vagrant and VirtualBox, so these two need to be installed first.

The VM will be provisioned as a Docker host with docker-compose, a plugin is needed for this:

```bash
vagrant plugin install vagrant-docker-compose
```

## Start VM

```bash
vagrant up
```

## Check round-robin

```bash
./test-round-robin.sh
```

## Stop and clean-up

```bash
vagrant destroy
```
