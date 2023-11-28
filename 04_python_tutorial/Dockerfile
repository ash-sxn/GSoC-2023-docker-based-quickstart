# Use a base image
FROM debian:bookworm-20231120 as cloning-stage

# Set ARGs for the GitHub credentials and repository
ARG GITHUB_USERNAME
ARG GITHUB_PASSWORD
ARG REPO_NAME=jenkins-docs/simple-python-pyinstaller-app

# Install Git and gh
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt update && apt install gh -y

# Clone the repository
RUN cd /tmp && \
    echo "$GITHUB_PASSWORD" | gh auth login --with-token && \
    gh repo fork "$REPO_NAME" --clone=true --remote=true --default-branch-only=true && \
    pwd && \
    ls -artl


FROM scratch AS export-stage
COPY --from=cloning-stage /tmp/simple-python-pyinstaller-app /

