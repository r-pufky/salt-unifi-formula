{%- from "unifi/map.jinja" import unifi with context -%}
{%- set import_cert = unifi.keystore.keytool ~ ' -importkeystore -srckeystore ' ~ unifi.keystore.cache ~ ' -srcstoretype PKCS12 -destkeystore ' ~ unifi.keystore.dest ~ ' -deststorepass ' ~ unifi.keystore.password ~ ' -srcstorepass ' ~ unifi.keystore.password -%}

load_ssl_to_keystore:
  file.managed:
    - name: {{ unifi.keystore.cache }}
    - contents_pillar: unifi:lookup:keystore:ssl_cert
