FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Instalacja Pythona 3.8
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3.8-dev python3-pip

# Instalacja Javy 8
RUN apt-get install -y \
    openjdk-8-jdk

# Instalacja Kotlina
RUN apt-get install -y \
    wget && \
    wget -q -O - https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC3E640A1E5E710C3 | gpg --dearmor | tee /usr/share/keyrings/netflix-repo-archive-keyring.gpg &>/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/netflix-repo-archive-keyring.gpg] https://packages.netflix.com/deb stable main" | tee /etc/apt/sources.list.d/netflix.list && \
    apt-get update && \
    apt-get install -y kotlin

# Ustawienie zmiennej środowiskowej PATH, aby można było wywołać polecenia Kotlina
ENV PATH="/usr/lib/kotlin/bin:${PATH}"
