#!/bin/bash
#Script de update automatico de bases para respositórios no git

#OBS: Use sh nome.sh para executar este arquivo
#OBS2: Esse arquivo deve estar dentro da pasta (raiz) do repositório da sua base

#Gera o nome do arquivo (data de hoje separando por '_')
name_file=`date +%d_%m_%Y`

#Conecta com o mysql e faz dump da base (já com o nome do arquivo da linha anterior)
mysqldump nome_do_seu_banco > $name_file.sql -u seu_usuario_aqui -p sua_senha_aqui

#Gera o nome da pasta baseado no mês e ano atual (padrão)
name_dir=`date +%m_%Y`

#Caso a pasta não exista
if [ ! -d "$name_dir" ]; then
   #Cria a pasta correspondente
   mkdir $name_dir
fi

#Move o arquivo criado para a pasta criada
mv $name_file.sql $name_dir/


#Comandos do git para enviar a base
git add .

git commit -m "Dump da base - Gerado Via Script"

git push origin master
