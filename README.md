# Installs and configures ACME protocol for Sectigo - Debian only

You need an administrator for WS API only. Fill your organization details and administrator's username and 
passwd in `./defaults/secret.yaml`; check example secret file then encrypt it with:

    ansible-vault encrypt --vault-password-file master.key defaults/secret.yaml

(you need of course a password in master.key)

Invoke the task with:

    time ansible-playbook acme.yaml --limit toad --vault-password-file master.key

## Add alt names to certificate

Given a host whose fqdn is `host.example.org` the certificate dn would be `host.example.org`.

In order to add more alternative names, invoke ansible with extra vars at runtime:

    ansible-playbook [...all as above...] --extra-vars '{"alt_names":["box01.example.org","box02.example.org"]}'
    
## Explore and debug

Get latest Sectigo API handbook; on mid December 2020 it was a huge html doc titled: certmgr-api-doc-20.11.html

Look in explore. Customize .config and organizationId.sh

## Other guidelines

It is not possible to share an ACME account between different servers. As soon as it is activated can't be activated 
another time.

However, if you prefer, you can generate the ACME account by your own and just fill the account name in the 
`account_name` var in `acme.yaml`. The script will pick it up.

Right now (december 2020) it's not possible to delete a pending ACME account. Only active 
ACME accounts can be deleted.

The playbook is idempotent: as it finds the ACME account and the right 
directory frame in `/etc/letsencrypt` on the host machine, it will skip the tasks.

If you need to re-deploy a certificate you would need to:
* delete the ACME account on the Sectigo website;
* `cd /etc/letsencrypt; rm -rf accounts live archive renewal csr keys`;
* make sure apache2 can restart without errors (quite unlikely if it was configured to 
use keys and certs deleted on the previous step).
