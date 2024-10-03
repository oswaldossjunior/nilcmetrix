#!/bin/bash
echo "Restaurando banco de dados a partir de /shared/cohmetrix_pt_br..."
pg_restore -U cohmetrix -d cohmetrix /shared/cohmetrix_pt_br || echo "Erro ao restaurar o banco de dados"
