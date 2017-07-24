FROM frolvlad/alpine-glibc:alpine-3.6
LABEL maintainer "tsub <tsubasatakayama511@gmail.com>"

ENV HACONIWA_VERSION="0.8.7" \
    ENTRYKIT_VERSION="0.4.0" \
    BUILD_DEPENDENCIES="curl"

RUN apk add --update --no-cache \
        ${BUILD_DEPENDENCIES} \
        libressl \
        lxc \
        lxc-templates && \
    curl -fSL -o haconiwa.tgz "https://github.com/haconiwa/haconiwa/releases/download/v${HACONIWA_VERSION}/haconiwa-v${HACONIWA_VERSION}.x86_64-pc-linux-gnu.tgz" && \
    tar -xvzf haconiwa.tgz -C /usr/local/bin && \
    rm haconiwa.tgz && \
    \
    curl -fSL -o entrykit.tgz "https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz" && \
    tar -xvzf entrykit.tgz -C /usr/local/bin && \
    entrykit --symlink && \
    rm entrykit.tgz && \
    \
    apk del --purge \
        ${BUILD_DEPENDENCIES}

ENTRYPOINT [ \
    "switch", \
        "sh=/bin/sh", \
        "ash=/bin/ash", \
        "shell=/bin/ash", \
        "--", \
    "haconiwa" \
]
