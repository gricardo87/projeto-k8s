# Documentação do Projeto Kubernetes

## Visão Geral

Este projeto utiliza o Kubernetes (K8s) com Minikube para gerenciar e implantar aplicações em um ambiente de desenvolvimento local. Esta documentação fornece instruções detalhadas sobre como criar o cluster, realizar o deploy dos manifestos e configurar o Ingress.

## Pré-requisitos

Antes de iniciar, certifique-se de que você tem o seguinte instalado em sua máquina:

- [Minikube](https://minikube.sigs.k8s.io/docs/start/) 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) 

## 1. Clone do repositório:

1. Abra o terminal.
2. Execute o comando:

```bash
git clone https://github.com/gricardo87/projeto-k8s.git
```

## 2. Criação do Cluster & Deploy dos Manifestos.

1. Abra o terminal dentro do repositório clonado anteriormente.
2. Execute o script:

```bash
cd projeto-k8s
chmod +x deploy.sh
./deploy.sh
```

## 3. Aguarde o Deploy ser Finalizado

É necessário esperar até que o deploy seja concluído. Aguarde até que todos os pods estejam no status `Running`. Para verificar o status dos pods, use o seguinte comando:

```bash
kubectl get pods --all-namespaces
```
Exemplo de saída esperada:

```
NAMESPACE       NAME                                       READY   STATUS      RESTARTS      AGE
default         frontend-85bf9b5568-8xc6c                  1/1     Running     0             24m
default         guess-599f46f486-prd68                     1/1     Running     0             24m
default         guess-599f46f486-rvrf7                     1/1     Running     0             24m
default         guess-599f46f486-zz62h                     1/1     Running     0             24m
default         postgres-745494fd46-cn4rx                  1/1     Running     0             24m
ingress-nginx   ingress-nginx-admission-create-m59qs       0/1     Completed   0             25m
ingress-nginx   ingress-nginx-admission-patch-jkzw5        0/1     Completed   0             25m
ingress-nginx   ingress-nginx-controller-bc57996ff-nvftm   1/1     Running     0             25m
kube-system     coredns-6f6b679f8f-dc9rf                   1/1     Running     0             25m
kube-system     etcd-minikube                              1/1     Running     0             25m
kube-system     kube-apiserver-minikube                    1/1     Running     0             25m
kube-system     kube-controller-manager-minikube           1/1     Running     0             25m
kube-system     kube-proxy-gbqtl                           1/1     Running     0             25m
kube-system     kube-scheduler-minikube                    1/1     Running     0             25m
kube-system     storage-provisioner                        1/1     Running     1 (24m ago)   25m
```

## 4. Configuração do Ingress

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

## 5. Acessando a Aplicação

Depois de seguir todos os passos acima, você poderá acessar sua aplicação em `http://frontend.gabrielricardo.com`. Certifique-se de que o Ingress está configurado corretamente e que os manifestos foram aplicados com sucesso.

## 6. Observação

Nos deployments dos ambientes, foi adicionada a seguinte annotation:

```yaml
config.kubernetes.io/depends-on
```

Essa annotation permite definir dependências entre recursos, garantindo a ordem de inicialização dos ambientes. Com ela, podemos assegurar que os componentes são iniciados na sequência correta.

## 7. Conclusão

Você agora configurou com sucesso um ambiente Kubernetes local utilizando Minikube, implantou sua aplicação e configurou o Ingress para acessá-la. Para mais informações sobre o Kubernetes e o Minikube, consulte a documentação oficial.
