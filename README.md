# 3source-base

This docker image is the base image for most of the images
used in the [3source](https://github.com/mogria/3source) project.

It features two imporant scripts:

 * `umask-wrapper.sh` this sets `umask` to `002`
 * `container-user.sh` this creates a user of the given UID, and executes the given command as this user.
   This is required to properly handle the `/data` permissions.

View on [dockerhub](https://hub.docker.com/r/mogria/3source-phpcli)
View on [github](https://github.com/mogria/3source-data).
