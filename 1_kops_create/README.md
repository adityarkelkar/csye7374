# Kubernetes Cluster Creation with KOPS

- This section focuses on creating a k8s cluster with the help of [**KOPS**](https://github.com/kubernetes/kops) and [**Ansible**](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)
- If you do not wish to use ansible, follow the instructions mentioned in the document [**KOPS.pdf**](https://github.com/adityarkelkar/csye7374-fall2018/blob/master/KOPS.pdf)

### Pre-requisites
- Make sure you have [**ansible**](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed on your system

### Steps
- Navigate to `1_kops_create`
- Set required variables in the yaml file
- Run the command `ansible-playbook create_k8s.yml --vvv`

