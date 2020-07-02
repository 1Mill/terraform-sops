IMAGENAME=terraform-sops
VERSION=`date +%Y-%m-%d_%H-%M-%S`

echo "${PASSWORD}" | docker login --username ${USERNAME} --password-stdin && \
docker build . --file Dockerfile --tag temp-image && \
docker tag temp-image ${USERNAME}/${IMAGENAME}:${VERSION} && \
docker tag temp-image ${USERNAME}/${IMAGENAME}:latest && \
docker push ${USERNAME}/${IMAGENAME}:${VERSION} && \
docker push ${USERNAME}/${IMAGENAME}:latest
