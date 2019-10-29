# CAF Jenkins Dockerfiles

These are the docker build files we use for (some) of our Jenkins build nodes. Since Jenkins accesses the running nodes via SSH there is an `authorized_keys` file with the pub key of the Jenkins master. The nodes should have all dependencies to build CAF in debug and release mode.

There are two scripts, one to build and one to upload the images. Login before uploading images.  Details can be configured via environment variables, see the scripts for details. Per default all files with the prefix `caf-jenkins-` will be build as Dockerfiles, the images will have the same name under the `inetjenkins/` user. The upload script assigns a version based on the year, month, and day as well as the latest tag.
