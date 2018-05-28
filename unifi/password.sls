{%- from "unifi/map.jinja" import unifi, config with context -%}
{%- set old_password = config.get('password_old', unifi.keystore.password) -%}
{%- set change_password = unifi.keystore.keytool ~ ' -storepasswd -storepass ' ~ old_password ~ ' -new ' ~ config.password -%)}

set_keystore_passwd:
  cmd.run:
    - name: {{ change_password }}
    - shell: /bin/sh
