FROM debian:bookworm as prepare-stage

COPY *sh /usr/local/bin/

RUN chmod +x /usr/local/bin/*.sh

RUN apt update && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    nano \
    openssh-client \
    procps \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN /usr/local/bin/keygen.sh /ssh-dir

# FROM debian:bookworm AS export-stage
# COPY --from=prepare-stage /app /app

# Add any additional files or directories needed for your application
# COPY --from=prepare-stage /path/to/your/files /destination/path

# Specify the command to run when the container starts
# CMD ["sh", "-c", "echo 'Export stage is ready'; tail -f /dev/null"]
CMD ["sh", "-c", "echo 'Export stage is ready'; ls -l /ssh-dir/"]
