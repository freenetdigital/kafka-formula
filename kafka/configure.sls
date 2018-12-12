{% from 'kafka/map.jinja' import kafka with context %}
{% set log_dirs = salt['pillar.get']('kafka:server_conf:log.dirs', '/tmp/kafka-logs') %}

server_properties:
    file.managed:
        - name: {{ kafka.home }}/config/server.properties
        - source: salt://kafka/files/server.properties.jinja
        - template: jinja
        - context:
            conf: {{ kafka.server_conf }}

environment_file:
    file.managed:
        - name: {{ kafka.environment_file }}
        - source: salt://kafka/files/environment.jinja
        - template: jinja
        - context:
            kafka: {{ kafka }}

log.dirs_folder:
    file.directory:
        - name: {{ log_dirs }}
        - runas: {{ kafka.user }}
        - user: {{kafka.user}}
        - group: {{kafka.user}}
        - unless: test -f {{ log_dirs }}
