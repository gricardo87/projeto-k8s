# Documentação do Projeto Kubernetes

## Visão Geral

Este projeto utiliza o Kubernetes (K8s) com Minikube para gerenciar e implantar aplicações em um ambiente de desenvolvimento local. Esta documentação fornece instruções detalhadas sobre como criar o cluster, realizar o deploy dos manifestos e configurar o Ingress.

## Pré-requisitos

Antes de iniciar, certifique-se de que você tem o seguinte instalado em sua máquina:

- [Minikube](https://minikube.sigs.k8s.io/docs/start/) 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) 

## 1. Criação do Cluster & Deploy dos Manifestos do projeto, usando o script localizado na raiz do projeto, chamado `deploy.sh`.

1. Abra o terminal.
2. Execute o script:

```bash
chmod +x deploy.sh
./deploy.sh
```

## 2. Configuração do Ingress

Para testar o Ingress, é necessário criar uma entrada no arquivo de hosts local. Siga os passos abaixo:

1. Obtenha o IP do Minikube utilizando o seguinte comando:

   ```bash
   minikube ip
   ```

2. Edite o arquivo de hosts (`/etc/hosts`) e adicione uma entrada apontando para o IP do Minikube. Abra o arquivo com um editor de texto:

   ```bash
   sudo vim /etc/hosts
   ```

   Adicione a seguinte linha ao arquivo:

   ```plaintext
   <IP_DO_MINIKUBE> frontend.gabrielricardo.com
   ```

   Certifique-se de substituir `<IP_DO_MINIKUBE>` pelo endereço IP obtido no passo anterior.

   Salve as alterações e reinicie o navegador.

## 4. Acessando a Aplicação

Depois de seguir todos os passos acima, você poderá acessar sua aplicação em `http://frontend.gabrielricardo.com`. Certifique-se de que o Ingress está configurado corretamente e que os manifestos foram aplicados com sucesso.

## Conclusão

Você agora configurou com sucesso um ambiente Kubernetes local utilizando Minikube, implantou sua aplicação e configurou o Ingress para acessá-la. Para mais informações sobre o Kubernetes e o Minikube, consulte a documentação oficial.
