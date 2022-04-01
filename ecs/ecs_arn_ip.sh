#!/bin/bash
clear
echo "Digite o cluster:"
read cluster
echo "Digite o service name:"
read service
echo "Digite o IP para procura. Exemplo: 172.11.94.128"
read privateIpv4Addres
echo "Seria o cluster $cluster, com o service name $service, e task de endereço IP $privateIpv4Addres? Se sim digite \(y\), se não digite \(n\). Não podem haver espaços ou erros de escrita!!!" 
read confirm

if [ $confirm = y ]; then
echo "Procura sendo efetuada, o processo pode demorar por volta de 5 minutos para escanear 100 tasks!"
aws ecs list-tasks --cluster $cluster --service-name $service | grep arn | cut -c 10-95 > ecs_arn_result.txt

while IFS= read -r linha; do
	aws ecs describe-tasks --cluster $cluster --tasks $linha | grep -e \"taskArn\": -e "\"privateIpv4Address\":\ \"$privateIpv4Addres\"" -m 2 > ecs_arn_ip_temp.txt
	search=$(grep -o -m 1 $privateIpv4Addres ecs_arn_ip_temp.txt)
	if [[ "$privateIpv4Addres" == "$search" ]]; then
	cp ecs_arn_ip_temp.txt ecs_arn_ip_encontrada.txt
	echo "Encontrada!!!"
	break
	else
	echo "Lendo task..."
	fi
done < ecs_arn_result.txt

ARN=$(grep taskArn ecs_arn_ip_encontrada.txt | cut -c 33-118)

else
echo "Saindo... Se digitou errado tente novamente!"
exit
fi

echo "A task com o IP $privateIpv4Addres encontrada possui a arn $ARN"
echo "Deseja executar o comando de stop na mesma? Se sim digite \(y\), se não digite \(n\)."
read confirm2
if [ $confirm2 = y ]; then
echo "$ARN"
#aws ecs stop-task --cluster $cluster --task $ARN.....
echo "Comando realizado, confirme na interface via web!!!"
else
echo "Saindo... Se digitou errado tente novamente!"
fi












