## Make image dir for download capi, aws images
if [ ! -d img ]; then
   mkdir img
fi

## Pull images: 0. cert-manager.yaml
sudo docker pull quay.io/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION} > img/cert-manager-controller:${CERT_MANAGER_VERSION}.tar

sudo docker pull quay.io/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION} > img/cert-manager-webhook:${CERT_MANAGER_VERSION}.tar

sudo docker pull quay.io/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION} > img/cert-manager-cainjector:${CERT_MANAGER_VERSION}.tar

## Download binary files and yaml files
curl -L https://github.com/jetstack/cert-manager/releases/download/${CERT_MANAGER_VERSION}/cert-manager.yaml > cert-manager-${CERT_MANAGER_VERSION}.yaml