FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# hadolint ignore=SC1091
RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
        sudo=1.9.15p5* \
        openssh-server=1:9.6p1* \
        supervisor=4.2.5* \
        ca-certificates=20240203 \
        curl=8.5.0* \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update -y \
    && apt-get install --no-install-recommends -y \
        docker-ce=5:28.3.3* \
        docker-ce-cli=5:28.3.3* \
        containerd.io=1.7.27* \
        docker-buildx-plugin=0.26.1-1* \
        docker-compose-plugin=2.39.1-1* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'root:password123' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && mkdir -p /var/log/supervisor \
    && chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]