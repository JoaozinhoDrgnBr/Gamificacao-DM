FROM gitpod/workspace-full

# Instalação do Flutter
RUN wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.10.1-stable.tar.xz \
    && tar xf flutter.tar.xz -C /home/gitpod \
    && rm flutter.tar.xz

ENV PATH="$PATH:/home/gitpod/flutter/bin"

# Configuração do Flutter
RUN flutter config --no-analytics \
    && flutter precache
