## Push image to REGISTRY: kube-rbac-proxy
sudo docker load < img/kubebuilder_kube-rbac-proxy_$KUBE_RBAC_PROXY_VERSION.tar 
sudo docker tag gcr.io/kubebuilder/kube-rbac-proxy:$KUBE_RBAC_PROXY_VERSION $REGISTRY/kubebuilder/kube-rbac-proxy:$KUBE_RBAC_PROXY_VERSION
sudo docker push $REGISTRY/kubebuilder/kube-rbac-proxy:$KUBE_RBAC_PROXY_VERSION

## Push image to REGISTRY: 0.cert-manager.yaml
sudo docker load < img/cert-manager-controller:$CERT_MANAGER_VERSION.tar
sudo docker tag quay.io/jetstack/cert-manager-controller:$CERT_MANAGER_VERSION $REGISTRY/jetstack/cert-manager-controller:$CERT_MANAGER_VERSION
sudo docker push $REGISTRY/jetstack/cert-manager-controller:$CERT_MANAGER_VERSION

sudo docker load < img/cert-manager-webhook:$CERT_MANAGER_VERSION.tar
sudo docker tag quay.io/jetstack/cert-manager-webhook:$CERT_MANAGER_VERSION $REGISTRY/jetstack/cert-manager-webhook:$CERT_MANAGER_VERSION
sudo docker push $REGISTRY/jetstack/cert-manager-webhook:$CERT_MANAGER_VERSION

sudo docker load < img/cert-manager-cainjector:$CERT_MANAGER_VERSION.tar
sudo docker tag quay.io/jetstack/cert-manager-cainjector:$CERT_MANAGER_VERSION $REGISTRY/jetstack/cert-manager-cainjector:$CERT_MANAGER_VERSION
sudo docker push $REGISTRY/jetstack/cert-manager-cainjector:$CERT_MANAGER_VERSION

kubectl apply -f cert-manager-${CERT_MANAGER_VERSION}.yaml