Dockerfile directory-deletion bug
==============================

In some cases, a `Dockerfile` is unable to remove a directory that a parent image created... _even if the parent image removed the directory and the final parent image does not include that directory!_

As far as I can tell, this

1. Only affects Docker daemons using the AUFS storage driver
2. Is fixed in the latest combo of Docker + AUFS.

Usage
==============================

1. Clone this repository
2. Run `make build`
3. Run `make test`

Expected Output:

	$ make test
	PARENT: /stuff dir created with COPY and deleted in parent should be empty:
	    OK
	PARENT: /stuff-mkdir dir created with 'mkdir' and deleted in parent should be empty:
	    OK
	CHILD: /stuff dir created with COPY and deleted in child should be empty:
	    OK
	CHILD: /stuff-mkdir dir created with 'mkdir' and deleted in child should be empty:
	    OK

Known Combinations
==============================

| OS     | OS Version | Kernel Version               | Docker Version | Storage Driver                   | Affected? |
| ------ | ---------- | ---------------------------- | -------------- | -------------------------------- | --------- |
| Ubuntu | 14.04      | 3.13.0-119-generic           | 1.13.1         | aufs `1:3.2+20130722-1.1`        | y         |
| Ubuntu | 14.04      | 3.13.0-119-generic           | 17.05.0-ce     | aufs `1:3.2+20130722-1.1`        | y         |
| Ubuntu | 16.04      | 4.4.0-119-generic            | 17.05.0-ce     | aufs `1:3.2+20130722-1.1ubuntu1` |           |
| CentOS | 7.3.1611   | 3.10.0-514.26.2.el7.x86_64   | 1.13.1         | devicemapper                     |           |
| Alpine | 3.5.0      | 4.9.49-moby (docker-for-mac) | 17.09.1-ce     | overlay2                         |           |

Related Issues
==============================

* https://github.com/moby/moby/issues/35257 (`overlay` driver)
* https://github.com/moby/moby/issues/36103 (`overlay` driver)
