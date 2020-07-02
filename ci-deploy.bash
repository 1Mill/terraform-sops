VERSION=`date +%Y-%m-%d_%H-%M-%S`

echo "${PASSWORD}" | docker login --username ${USERNAME} --password-stdin && \
docker build . --file Dockerfile --tag tmp-image && \
docker tag tmp-image 1mill/terraform-sops:${VERSION} && \
docker push 1mill/terraform-sops:${VERSION} && \
docker push 1mill/terraform-sops:latest
