# cicd-lab

Infrastructure:

![alt tag](https://raw.githubusercontent.com/karrung/cicd-lab/master/documents/images/server_infra-1.png)

## Requirement:

Ubuntu 1 | Ubuntu 2
---------|----------
IP: 192.168.1.200/24 | IP: 192.168.1.201/24
docker |
docker-compose |
ansible |

> Note: Both machines run as root user. All machines can ssh access by root without password to another.

## Installation:

  - ### Ubuntu 1: Prepare installation
  ```sh
  git clone https://github.com/karrung/cicd-lab.git
  cd cicd-lab
  chmod +x ubuntu1-1-init.sh
  ./ubuntu1-1-init.sh
  ```

  - ### Ubuntu 1: Build customize jenkins
  ```sh
  docker build -t myjenkins jenkins-docker
  ```

  - ### Ubuntu 1: Installation and start Jenkins, Docker Registry and Gitlab
    ```sh
    docker-compose up -d
    ```

  - ### Ubuntu 1: Set up Jenkins
    - Open Jenkins http://192.168.1.200:8080
      - Initial setup,
      - Install suggested plugins
      - Setup admin account
      - Start using jenkins
      - Open http://192.168.1.200:8080/pluginManager/available
        - Install Gitlab Hook Plugin and restart Jenkins

  - ### Ubuntu 1: Set up Gitlab
    - Open Gitlab http://192.168.1.200:10080
      - Create new password for root user.
      - Signin with root user.
      - New project:
        - Project name: ckan
        - Import project from: Repo by URL https://github.com/karrung/ckan.git
        - Visibility Level: Internal




















Usage:

  - Ubuntu 1:

  ```sh
  ansible-playbook -i ansible/host.txt ansible/prepare_docker.yaml
  docker build -t myjenkins jenkins-docker
  ```

Ubuntu 1
git clone https://github.com/karrung/cicd-lab.git
mkdir -p ./assets/gitlab
mkdir -p ./assets/jenkins_home
mkdir -p ./assets/postgresql
mkdir -p ./assets/redis

Ubuntu 2
echo 'DOCKER_OPTS="--insecure-registry 192.168.1.200:5000"' | tee -a /etc/default/docker
service docker restart


echo '{ "insecure-registries":["192.168.1.200:5000"] }' > /etc/docker/daemon.json
