#!/bin/bash

# Adicionar o caminho do pacote idd3 ao PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/opt/text_metrics/tools

# Execute o script Python diretamente no container
python3 run_min.py "Aprender a ler é aprender a ser livre."