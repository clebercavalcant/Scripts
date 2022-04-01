#!/bin/bash
clear
echo "O profile padrão é o default. Os scripts estão configurados para o mesmo no momento. Digite "default" ou outro nome específico:"
read profile
echo "[$profile]" >> credentials
echo "[$profile]" >> config
echo "Digite a region default:"
read region
echo "Digite a AWS Access Key Id:"
read aws_access_key_id
echo "Digite a AWS Secret access key:"
read aws_secret_access_key
echo "Digite a AWS session token:"
read aws_session_token
echo "region = $region" >> config
echo "aws_access_key_id = $aws_access_key_id" >> credentials 
echo "aws_secret_access_key = $aws_secret_access_key" >> credentials
echo "aws_session_token = $aws_session_token" >> credentials
cp credentials ~/.aws/
cp config ~/.aws/
echo "Deseja configurar mais perfis? Se sim digite \(y\), se não digite \(n\)."
read repetir
if [ $repetir = y ]; then
    ./acesso_AWS.sh
else
echo "ATENÇÂO ==> Os perfis específicos precisam de --profile "perfil" sem as aspas depois do comando a ser usado."
exit
fi
