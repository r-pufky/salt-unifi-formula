{%- from "unifi/map.jinja" import unifi, config with context -%}
{%- set password = config.get('password', unifi.keystore.password) -%}
{%- set import_cert = unifi.keystore.keytool ~ ' -importkeystore -srckeystore ' ~ unifi.keystore.cache ~ ' -srcstoretype PKCS12 -destkeystore ' ~ unifi.keystore.dest ~ ' -deststorepass ' ~ password ~ ' -srcstorepass ' ~ password ~ ' -noprompt' -%}
{%- set ssl_cert = config.get('ssl_cert', '') -%}


ubiquiti_unifi_repo:
  pkgrepo.managed:
    - name: deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti
    - keyid: 4A228B2D358A5094178285BE06E85760C0A52C50
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - ubiquiti_install

unifi_package_dependencies:
  pkg.installed:
    - pkgs:
      - {{ unifi.package }}
{%- for pkg in unifi.package_dependencies %}
      - {{ pkg }}
{%- endfor %}

{% if ssl_cert %}
load_ssl_to_keystore:
  file.managed:
    - name: {{ unifi.keystore.cache }}
    - contents_pillar: unifi:config:ssl_cert
  cmd.run:
    - name: {{ import_cert }}
    - shell: /bin/sh

remove_keystore_input:
  file.absent:
    - name: {{ unifi.keystore.cache }}
    - require:
      - cmd: load_ssl_to_keystore
{% endif %}

ubiquiti_service:
  service.running:
    - name: unifi
    - enable: True
    - require:
      - pkg: unifi_package_dependencies
