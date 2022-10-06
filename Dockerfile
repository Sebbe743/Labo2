FROM ubuntu:latest
COPY . .
RUN apt-get install unzip \
  wget https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip \
  unzip terraform_1.0.7_linux_amd64.zip \
  sudo mv terraform /usr/local/bin/ \
  terraform --version 
ENTRYPOINT[terraform deploy]
