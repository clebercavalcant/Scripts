#!/bin/bash
clear
echo "ATENÇÃO ==> O script vai zerar o arquivo de configuração de perfil atual. Deseja continuar? Se sim digite \(y\), se não digite \(n\)."
read confirm
if [ $confirm = y ]; then
touch credentials ~/.aws/credentials
touch config ~/.aws/config
rm credentials ~/.aws/credentials
rm config ~/.aws/config
repetir=y
while [ $repetir = y ]; do
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
echo "Deseja configurar mais perfis? Se sim digite \(y\), se não digite \(n\)."
read repetir
done
cp credentials ~/.aws/
cp config ~/.aws/
else
echo "ATENÇÂO ==> Os perfis específicos precisam de --profile "perfil" sem as aspas depois do comando a ser usado."
fi
exit