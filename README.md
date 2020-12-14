# Installs and configures acme protocol for sectigo - debian only

You need an administrator for WS API only. Fill your organization details and administrator's usernme and 
passwd in ./defaults/secret.yaml 

Invoke the task with:

    time ansible-playbook acme.yaml --limit toad --vault-password-file master.key

# IT DOES NOT WORK NOW YET

## Decrypt secrets

    ansible-vault decrypt --vault-password-file master.key defaults/secret.yaml

## Add alt names to certificate

Given a host whose fqdn is host.example.org the certificate dn would be host.example.org.

In order to add more alternative names, either add a file in ./vars/ (check the box.example.org.yaml example) or
invoke ansible with extra vars at runtime:

    ansible-playbook [...all as above...] --extra-vars '{"alt_names":["box01.example.org","box02.example.org"]}'