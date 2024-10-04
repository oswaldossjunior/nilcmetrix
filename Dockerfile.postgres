FROM postgres:13

# Variáveis de ambiente do banco de dados
ENV POSTGRES_USER=cohmetrix
ENV POSTGRES_PASSWORD=cohmetrix
ENV POSTGRES_DB=cohmetrix

# Copia o script de restauração para o container
COPY ./tools/postgres /shared
COPY ./initdb/restore.sh /docker-entrypoint-initdb.d/

# Dá permissão de execução ao script
RUN chmod +x /docker-entrypoint-initdb.d/restore.sh

# Inicia o PostgreSQL automaticamente com a restauração
CMD ["postgres"]
