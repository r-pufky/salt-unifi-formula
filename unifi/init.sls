{%- from "unifi/map.jinja" import unifi with context -%}

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

ubiquiti_service:
  service.running:
    - name: unifi
    - enable: True
    - require:
      - pkg: unifi_package_dependencies
