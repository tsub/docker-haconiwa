# docker-haconiwa

Docker image for [Haconiwa] :whale:

## Usage

```
$ docker pull tsub/haconiwa

# Generate DSL file template
$ docker run -it -v $PWD:$PWD -w $PWD tsub/haconiwa new \
    --name my-container \
    --root /var/lib/haconiwa/my-container \
    my-container.haco

# Run shell in haconiwa container
$ docker run -it -v $PWD:/work_dir -w /work_dir --privileged tsub/haconiwa shell

# Create haconiwa container
/work_dir # haconiwa create my-container.haco

# Run haconiwa container
/work_dir # haconiwa run my-container.haco
bash-4.3# ps
PID   USER     TIME   COMMAND
    1 root       0:00 /bin/bash
    2 root       0:00 ps
bash-4.3# exit
exit
```

## Install with [Whalebrew]

```
$ whalebrew install tsub/haconiwa

# Generate DSL file template
$ haconiwa new \
    --name my-container \
    --root /var/lib/haconiwa/my-container \
    my-container.haco
```

[Whalebrew] is not supported privileged access, so you can not not create an lxc container. :confused:

[Haconiwa]: https://github.com/haconiwa/haconiwa
[Whalebrew]: https://github.com/bfirsh/whalebrew
