FROM debian:jessie
MAINTAINER Sam Minot <sam@onecodex.com>

# Update and install Python
RUN apt-get update -y
RUN apt-get install -y python python-pip curl wget git pigz

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Install requirements.txt (One Codex CLI)
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt

# Add the AWS CLI binaries
RUN cd /tmp && \
    wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.0/sratoolkit.2.8.0-ubuntu64.tar.gz && \
    tar xzvf sratoolkit.2.8.0-ubuntu64.tar.gz && \
    cp sratoolkit.2.8.0-ubuntu64/bin/fastq-dump /usr/local/bin/

# Add join_paired_docs scripts
ADD https://gist.githubusercontent.com/boydgreenfield/805ac27e0a6b9a5adea7/raw/eae0640ea0b6b02dbe6bf22b18af605d04ce91f6/join_paired_ends.py /scripts/

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test