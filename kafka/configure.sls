{% from 'kafka/map.jinja' import kafka with context %}

server_properties:
    file.managed:
        - name: {{ kafka.home }}/config/server.properties
        - source: salt://kafka/files/server.properties.jinja
        - template: jinja
        - context:
            conf: {{ kafka.server_conf }}

