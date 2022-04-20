#!/bin/bash
clear

rm -rf *.json

echo "ATENÇÃO ==> É necessário fazer a configuração das keys da conta do Now da AWS <== ATENÇÃO"
echo "Já foi realizado a configuração da conta \y\ ou \n\?"
read confirm

#if [ $confirm = "y" -o $confirm = "Y" ]; then
#	echo "Realizando download do arquivo settings.json!"
#	aws s3 cp s3://nowonlinecloud-static/now-be/config/settings.json settings_bkp.json --region sa-east-1

	
	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	echo "Canal id 1:"
	read id1
	
	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	read id2

	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	read id3
	
	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	read id4
	
	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	read id5
	
	echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
	read id6

	echo "Digite o id do filme que irá ser apresentado no Autoplay:" 
	read id7
	
	jq '.banners.live.home = ['$id1', '$id2', '$id3', '$id4', '$id5', '$id6']' settings_bkp.json > settings_bkp1.json
      	jq '.banners.vodTrailer = ['$id7']' settings_bkp1.json	> settings.json

	##echo "Realizando upload do arquivo settings.json!"
	##aws s3 cp settings.json s3://nowonlinecloud-static/now-be/config/settings.json
	##sleep 3

	##echo "Reiniciando o ambiente Avsclient"
	##aws elasticbeanstalk restart-app-server --environment-name avsclient-default-prod-v1 --region sa-east-1
	##sleep 180

	##curl -H 'x-api-key: M0MRB0slDP6aEy1zrUAKlqueV3ZNoTI99JFFh762' -X GET "https://uidp0fwoib.execute-api.sa-east-1.amazonaws.com/v1?parametro=home&env=prod"

else
	echo "Retorne ao menu inicial e escolha a opção 1"
	sleep 4
	./AWS_CLI.sh
fi

