# Usar a imagem base ubuntu:focal
FROM ubuntu:focal

# Definir o fuso horário
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Atualizar o repositório de pacotes
RUN apt-get update

# Instalar pacotes necessários
RUN apt-get install -y python3 python3-pip python3-numpy default-jre

# Instalar o psycopg2 (driver do PostgreSQL)
RUN pip3 install psycopg2-binary

# Instalar as dependências do requirements.txt
COPY requirements.txt /opt/text_metrics/requirements.txt
RUN pip3 install -r /opt/text_metrics/requirements.txt

# Instalar o nltk e baixar todos os corpora
RUN python3 -m nltk.downloader all

# Limpar o cache do apt para reduzir o tamanho da imagem
RUN apt-get clean

# Definir o diretório de trabalho
WORKDIR /opt/text_metrics

# Copiar o conteúdo do projeto para o diretório de trabalho no container
COPY . .

# Expor a porta 8080 (caso necessário)
EXPOSE 8080

# Garantir que o script de execução tenha permissão de execução
RUN chmod +x run_minimal.sh

# Comando de inicialização da aplicação
ENTRYPOINT ["bash", "run_minimal.sh"]
