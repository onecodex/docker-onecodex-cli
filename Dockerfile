FROM debian:jessie
MAINTAINER Sam Minot <sam@onecodex.com>

# Update and install Python
RUN apt-get update -y
RUN apt-get install -y python python-pip
RUN apt-get install -y git

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Install requirements.txt (One Codex CLI)
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt

# Add binaries
ADD bin/fastq-dump /usr/local/bin/fastq-dump

# Add join_paired_docs scripts
ADD https://gist.githubusercontent.com/boydgreenfield/805ac27e0a6b9a5adea7/raw/30e4a7c4510115ea198b10aacdac232c1296fe3b/join_paired_ends.py /scripts/

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test