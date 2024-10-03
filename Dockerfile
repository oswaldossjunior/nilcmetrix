# Usar a imagem base ubuntu:focal
FROM ubuntu:focal

# Definir o fuso horário
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Atualizar o repositório
RUN apt-get update

# Instalar pacotes necessários
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-numpy
RUN apt-get install -y default-jre

# Instalar psycopg2 via pip
RUN pip3 install psycopg2-binary

# Instalar NLTK e baixar todos os corpora
RUN pip3 install nltk
RUN python3 -m nltk.downloader all

# Limpar o cache do apt para reduzir o tamanho da imagem
RUN apt-get clean

# Definir o diretório de trabalho
WORKDIR /opt/text_metrics

# Copiar o conteúdo do projeto para o diretório correto
COPY . /opt/text_metrics/

# Expor a porta (caso seja necessário para a aplicação)
EXPOSE 8080

# Comando de inicialização da aplicação
ENTRYPOINT ["bash", "run_minimal.sh"]
