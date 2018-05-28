{%- from "unifi/map.jinja" import unifi with context -%}
{%- set change_password = {{ unifi.keystore.keytool }} -storepasswd -storepass {{ unifi.keystore.password_old }} -new {{ unifi.keystore.password }}' -%)}

set_keystore_passwd:
  cmd.run:
    - name: {{ change_password }}
    - shell: /bin/sh
