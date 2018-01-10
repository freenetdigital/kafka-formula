{% from 'kafka/map.jinja' import kafka with context %}

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

