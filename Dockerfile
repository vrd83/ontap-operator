FROM quay.io/operator-framework/ansible-operator:v1.16.0

COPY requirements.yml ${HOME}/requirements.yml
COPY module_requirements.yml ${HOME}/module_requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && pip install -r module_requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
