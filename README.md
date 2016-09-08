# cicd-lab

Infrastructure:

![alt tag](https://raw.githubusercontent.com/karrung/cicd-lab/master/documents/images/server_infra1.png)

Requirement:

  - Ubuntu 1:

    ```
    IP address: 192.168.1.100/24

    ```

  - Ubuntu 2:

Installation:

  - Ubuntu 1:

  ```sh
  git clone https://github.com/karrung/cicd-lab.git
  cd cicd-lab
  chmod +x ubuntu1-1-init.sh
  ./ubuntu1-1-init.sh
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
