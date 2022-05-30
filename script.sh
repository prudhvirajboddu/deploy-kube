sudo apt-get update -y  && sudo apt-get install apt-transport-https -y

sudo su
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt update

#disable swap
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


modprobe br_netfilter
sysctl -p
sudo sysctl net.bridge.bridge-nf-call-iptables=1


apt-get install docker.io -y

sudo usermod -aG docker $USER
systemctl restart docker
systemctl enable docker.service

sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet.service
#sudo systemctl status docker


