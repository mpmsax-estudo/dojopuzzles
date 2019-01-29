#!/bin/bash
echo 'Inserir o nome do arquivo, a identificar quantidade de linhas de codigo'
read nomeArquivo
# tr -d ' ' - elimina os espacos | grep -v - grep invertido, elimina os comentarios
cat $nomeArquivo | tr -d ' ' | grep -v ^// | grep -v ^/"\*" | grep -v ^"\*" > arquivoTemporario.tmp
# count - conta as linhas que contem codigo
count=0
# verfica cada linha se contem codigo
for i in $(cat arquivoTemporario.tmp); do 
	identificador=$(echo $i | wc -w)
	if [ "$identificador" == "0" ]; then 
		continue
	else
		let count=$count+1
	fi;
done
echo 'Programa a contem ' $count ' linhas de codigo'

