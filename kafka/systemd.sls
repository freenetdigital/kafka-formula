{% from 'kafka/map.jinja' import kafka with context %}
include:
  - kafka.configure

kafka_systemd_unit:
    file.managed:
        - name: /etc/systemd/system/{{ kafka.service }}.service
        - source: salt://kafka/files/service.jinja
        - template: jinja
        - context:
            kafka: {{ kafka }}

kafka_enabled:
    service.running:
        - enable: True
        - name: {{ kafka.service }}
        - watch:
            - file: environment_file
            - file: server_properties
            - file: kafka_systemd_unit
