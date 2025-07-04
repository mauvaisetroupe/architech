FROM mcr.microsoft.com/devcontainers/base:debian

ENV HUGO_VERSION=0.147.7
ENV DART_SASS_VERSION=1.72.0

# Install Hugo
RUN ARCH=$(dpkg --print-architecture) && \
    wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-${ARCH}.deb \
    && apt-get update \
    && apt-get install -y /tmp/hugo.deb \
    && rm /tmp/hugo.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Dart Sass manually (compatible with amd64/x64 and arm64)
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "amd64" ]; then ARCH="x64"; fi && \
    if [ "$ARCH" = "arm64" ]; then ARCH="arm64"; fi && \
    curl -fL https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-${ARCH}.tar.gz \
    -o dart-sass.tar.gz && \
    tar -xzf dart-sass.tar.gz -C /opt && \
    ln -s /opt/dart-sass/sass /usr/local/bin/sass && \
    chmod +x /usr/local/bin/sass && \
    rm dart-sass.tar.gz


# Install Asciidoc
RUN apt-get update && apt-get install -y asciidoc && rm -rf /var/lib/apt/lists/*

# Install Ruby and Asciidoctor (required for Hugo's AsciiDoc rendering)
RUN apt-get update && apt-get install -y ruby ruby-dev build-essential && \
    gem install asciidoctor && \
    rm -rf /var/lib/apt/lists/*

    
# Set working directory
WORKDIR /workspace

# Use existing vscode user
USER vscode
