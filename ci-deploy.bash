VERSION=`date +%Y-%m-%d_%H-%M-%S` && \
docker build -t my-image . && \
docker tag my-image 1mill/terraform-sops:${VERSION} && \
docker push 1mill/terraform-sops:${VERSION} && \
docker push 1mill/terraform-sops:latest
