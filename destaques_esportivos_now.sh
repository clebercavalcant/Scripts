#!/bin/bash
clear

rm -rf *.json

echo "						
				**********************************************************************
				*Aqui você deverá informar o Id dos canais de destaques e do Autoplay*
				**********************************************************************
"
sleep 2

echo -e "Realizando download do arquivo settings.json!\n"
aws s3 cp s3://nowonlinecloud-static/now-be/config/settings.json settings_bkp.json --region sa-east-1 > /dev/null 2>&1

	
echo "Digite os Id's dos canais que irão ser apresentados no carrossel de destaques:"
echo "Canal id 1:"
read id1
##while ['$id1' != '^[0-9$]+$']; do
 
echo "Canal id 2:"
read id2

echo "Canal id 3:"
read id3
	
echo "Canal id 4:"
read id4
	
echo "Canal id 5:"
read id5
	
echo "Canal id 6:"
read id6

echo "Precisará alterar o filme do Autoplay?"
echo "Digite y ou n:"
read decisao

if [ $decisao = "y" ]; then

	echo "Digite o id do filme que irá ser apresentado no Autoplay:" 
	read id7
	
	jq '.banners.live.home = ['$id1', '$id2', '$id3', '$id4', '$id5', '$id6']' settings_bkp.json > settings_bkp1.json
	jq '.banners.vodTrailer = ['$id7']' settings_bkp1.json  > settings.json

else
	
	jq '.banners.live.home = ['$id1', '$id2', '$id3', '$id4', '$id5', '$id6']' settings_bkp.json > settings.json
fi

echo "Realizando upload do arquivo settings.json!"
#aws s3 cp settings.json s3://nowonlinecloud-static/now-be/config/settings.json
sleep 3

echo "Reiniciando o ambiente Avsclient"
#aws elasticbeanstalk restart-app-server --environment-name avsclient-default-prod-v1 --region sa-east-1
sleep 360

echo "Verifique no Console se o AVSClient já está OK, caso, sim, confirme no site WWW.NOWONLINE.COM.BR se as atualizações ja foram aplicadas. Caso, não tenham sido, aguardar mais uns minutos e verificar" 



