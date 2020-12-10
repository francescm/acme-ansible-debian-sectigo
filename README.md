# Installs and configures acme protocol for sectigo - debian only

You need an administrator for WS API only. Fill your organization details and administrator's usernme and passwd in ./defaults/main.yaml 

Invoke the task with:

    time ansible-playbook acme.yaml --limit toad --vault-password-file master.key

# IT DOES NOT WORK NOW YET
