# challenge-web-sensedia

Ferramentas utilizadas:

- Provider GCP (v2.8.0)
- IaC Terraform (v0.12.2)
- Container Docker (last version)

Código retornado pela aplicação: 
```json
{
	"mens": "Jonathan !! Aplicação ta no Ar",                                                                        
	"cod": "Informe o codigo: odewzwm2ngzjmgnmzty5mt"                                                                
}
```
Para replicar o processo:

1. Configurar uma conta na GCP.
2. Criar um projeto na GCP.
3. Gerar uma chave em JSON da Service Account através desse procedimento: https://cloud.google.com/iam/docs/creating-managing-service-account-keys.
4. Alterar no variables.tf o nome do projeto.
5. Alterar no provider, o path da chave JSON gerada no passo 3.
6. Fazer o git clone desse repositório.
7. Rodar o comando terraform init.
8. Rodar o comando terraform apply -auto-approve
9. Testar a aplicação com o comando curl http://<ip_externo_da_instancia>:5000 | jq
