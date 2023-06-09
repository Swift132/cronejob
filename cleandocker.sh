#/bin/bash
# Script Limpeza do Docker
# 2023 - By: Diogo Pacheco

options=("1" "2" "3" "4" "5" "6")
selected=()

clear
# Função para eliminar tudo
eliminar_tudo() {
  eliminar_containers
  eliminar_images
  eliminar_volumes
  eliminar_networks
}

# Função para eliminar containers
eliminar_containers() {
  if [ $(docker ps -aq | wc -l) -gt 0 ]; then
    echo "Deleting containers"
    docker rm $(docker ps -aq)
    echo -e "\e[32mContainers Deleted\e[0m"
  else
    echo -e "\e[31mThere are no containers to delete!\e[0m"
  fi
}

# Função para eliminar imagens
eliminar_images() {
  if [ $(docker image ls -q | wc -l) -gt 0 ]; then
    echo "Deleting images"
    docker rmi -f $(docker image ls -q)
    echo -e "\e[32mImages Deleted!\e[0m"
  else
    echo -e "\e[31mThere are no images to delete!\e[0m"
  fi
}

# Função para eliminar volumes
eliminar_volumes() {
  if [ $(docker volume ls -q | wc -l) -gt 0 ]; then
    echo "Deleting volumes"
    docker volume remove -f $(docker volume ls -q)
    echo -e "\e[32mVolumes Deleted!\e[0m"
  else
    echo -e "\e[31mThere are no volumes to delete\e[0m"
  fi
}

# Função para eliminar networks
eliminar_networks() {
  if [ $(docker network ls -q | wc -l) -gt 0 ]; then
    echo "Deleting networks"
    docker network rm $(docker network ls -q)
    echo "Networks deleted!"
  else
    echo "There are no networks to delete!"
    echo -e "\e[31mThere are no networks to delete!\e[0m"
  fi
}

sair() {
  echo -e "\e[31mSaindo.....\e[0m"
}

# Limpar o terminal
clear

# Perguntar ao utilizador o que é para eliminar
echo -e "\e[31m==============================\e[0m"
echo -e "\e[31mWhat you want to eliminate? X \e[0m"
echo -e "\e[31m==============================\e[0m"
echo -e "\e[1m1. Everything\e[0m"
echo -e "\e[1m2. Images\e[0m"
echo -e "\e[1m3. Volumes\e[0m"
echo -e "\e[1m4. Networks\e[0m"
echo -e "\e[1m5. Containers\e[0m"
echo -e "\e[1m6. Exit\e[0m"
echo -e "\e[31m===============\e[0m"

# Ler a opção do utilizador
read -p "Enter your choice (1-5): " choice

# Executar a função correspondente à opção escolhida pelo utilizador
case $choice in
  1)
    eliminar_tudo
    ;;
  2)
    eliminar_images
    ;;
  3)
    eliminar_volumes
    ;;
  4)
    eliminar_networks
    ;;
  5)
    eliminar_containers
    ;;
  6)
    sair
    ;;
  *)
    echo "Invalid choice. Exiting..."
    ;;
esac

echo
echo -e "\e[31m===============\e[0m"
echo -e "\e[31mDone!\e[0m"