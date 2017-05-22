{% from 'kafka/map.jinja' import kafka with context %}

kafka_systemd_unit:
    file.managed:
        - name: /etc/systemd/system/{{ kafka.service }}.service
        - source: salt://kafka/files/service.jinja
        - template: jinja
        - context:
            kafka: {{ kafka }}

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: kafka_systemd_unit

kafka_enabled:
    service.enabled:
        - name: {{ kafka.service }}
        - watch:
            - module: kafka_systemd_unit
