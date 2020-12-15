# Installs and configures ACME protocol for Sectigo - Debian only

You need an administrator for WS API only. Fill your organization details and administrator's usernme and 
passwd in ./defaults/secret.yaml; check example secret file then encrypt it with:

    ansible-vault encrypt --vault-password-file master.key defaults/secret.yaml

(you need of course a password in master.key)

Invoke the task with:

    time ansible-playbook acme.yaml --limit toad --vault-password-file master.key

## Add alt names to certificate

Given a host whose fqdn is host.example.org the certificate dn would be host.example.org.

In order to add more alternative names, either add a file in ./vars/ (check the box.example.org.yaml example) or
invoke ansible with extra vars at runtime:

    ansible-playbook [...all as above...] --extra-vars '{"alt_names":["box01.example.org","box02.example.org"]}'
    
## Explore and debug

Get latest Sectigo API handbook; on mid December 2020 it was a huge html doc titled: certmgr-api-doc-20.11.html

Look in explore. Customize .config and organizationId.sh
    