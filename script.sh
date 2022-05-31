sudo apt update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update

#disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


sudo modprobe br_netfilter
sudo sysctl -p
sudo sysctl net.bridge.bridge-nf-call-iptables=1

sudo apt install docker.io -y

sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo systemctl enable docker.service

sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet.service
#sudo systemctl status docker


