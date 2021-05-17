## Push image to REGISTRY: 0.cert-manager.yaml
sudo docker load < img/cert-manager-controller:${CERT_MANAGER_VERSION}.tar
sudo docker tag quay.io/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION} ${REGISTRY}/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION}
sudo docker push ${REGISTRY}/jetstack/cert-manager-controller:${CERT_MANAGER_VERSION}

sudo docker load < img/cert-manager-webhook:${CERT_MANAGER_VERSION}.tar
sudo docker tag quay.io/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION} ${REGISTRY}/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION}
sudo docker push ${REGISTRY}/jetstack/cert-manager-webhook:${CERT_MANAGER_VERSION}

sudo docker load < img/cert-manager-cainjector:${CERT_MANAGER_VERSION}.tar
sudo docker tag quay.io/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION} ${REGISTRY}/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION}
sudo docker push ${REGISTRY}/jetstack/cert-manager-cainjector:${CERT_MANAGER_VERSION}

## Change image registry
sed -i 's/quay.io\/jetstack\/cert-manager-controller:'${CERT_MANAGER_VERSION}'/'${REGISTRY}'\/jetstack\/cert-manager-controller:'${CERT_MANAGER_VERSION}'/g' cert-manager-${CERT_MANAGER_VERSION}.yaml
sed -i 's/quay.io\/jetstack\/cert-manager-webhook:'${CERT_MANAGER_VERSION}'/'${REGISTRY}'\/jetstack\/cert-manager-webhook:'${CERT_MANAGER_VERSION}'/g' cert-manager-${CERT_MANAGER_VERSION}.yaml
sed -i 's/quay.io\/jetstack\/cert-manager-cainjector:'${CERT_MANAGER_VERSION}'/'${REGISTRY}'\/jetstack\/cert-manager-cainjector:'${CERT_MANAGER_VERSION}'/g' cert-manager-${CERT_MANAGER_VERSION}.yaml

kubectl apply -f cert-manager-${CERT_MANAGER_VERSION}.yaml