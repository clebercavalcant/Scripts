#!/bin/bash
clear
echo "
**********************************************
*					     *
*	Selecione uma opção:                 *
*					     *
*	1 - Configurar acesso a AWS	     *
*	2 - Alterar destaques esportivos NOW *
*	3 - Trabalhar com o EC2		     *
*	4 - Trabalhar com o ECS		     *
*	5 - Trabalhar com o Route53	     *
*	6 - A definir (crie algo!)	     *
*	7 - A definir (crie algo!)	     *
*	8 - A definir (crie algo!)	     *
*	9 - A definir (crie algo!)	     *
*	0 - Sair			     *
*					     *
**********************************************   
"
read opcao

case $opcao in 
1)
	./acesso_AWS.sh
	aws sts get-caller-identity > IAM_identity
	;;
2)
	./destaques_esportivos_now.sh
	;;
3)	
	echo "Crie algo!"	
	;;
4)
        cd ecs/
        ./ecs_arn_ip.sh
        ;;
5)
        echo "Crie algo!"
        ;;
6)
        echo "Crie algo!"
        ;;
7)
        echo "Crie algo!"
        ;;
8)
        echo "Crie algo!"
        ;;
9)
        echo "Crie algo!"
        ;;
0)
        exit
        ;;
esac



