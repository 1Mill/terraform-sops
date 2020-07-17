FROM alpine:3

RUN apk update && apk add \
	git \
	unzip \
	wget

# Install terraform
ARG TERRAFORM_VERSION=0.12.28
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/
RUN rm /tmp/terraform.zip

# Install SOPS terraform provider plugin
ARG SOPS_PLUGIN_VERSION=0.5.1
RUN wget -O /tmp/sops.zip https://github.com/carlpett/terraform-provider-sops/releases/download/v0.5.1/terraform-provider-sops_${SOPS_PLUGIN_VERSION}_linux_386.zip
RUN mkdir -p ~/.terraform.d/plugins/linux_386
RUN unzip /tmp/sops.zip -d ~/.terraform.d/plugins/linux_386
RUN rm /tmp/sops.zip

RUN apk del unzip wget

WORKDIR /app

ENV \
	AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
	AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
	AWS_PROFILE=${AWS_PROFILE} \
	AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
	TF_VAR_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
	TF_VAR_AWS_PROFILE=${AWS_PROFILE} \
	TF_VAR_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

CMD [ "echo", "-- Finished --" ]
