{% from 'kafka/map.jinja' import kafka_settings with context %}

server_properties:
    file.managed:
        - name: /opt/kafka/config/server.properties
        - source: salt://kafka/files/server.properties.jinja
        - template: jinja
        - context:
            conf: {{ kafka_settings.conf }}

