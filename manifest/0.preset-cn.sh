## Make image dir for download capi, aws images
if [ ! -d img ]; then
   mkdir img
fi

source version.conf

## Pull images: 0. cert-manager.yaml
sudo docker pull quay.io/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION} > img/cert-manager-controller_${CERT_MANAGER_VERSION}.tar

sudo docker pull quay.io/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION} > img/cert-manager-webhook_${CERT_MANAGER_VERSION}.tar

sudo docker pull quay.io/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION}
sudo docker save quay.io/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION} > img/cert-manager-cainjector_${CERT_MANAGER_VERSION}.tar
