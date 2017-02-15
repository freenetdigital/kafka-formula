{% from 'kafka/map.jinja' import kafka_settings with context %}

kafka_systemd_unit:
    file.managed:
        - name: /etc/systemd/system/kafka-broker.service
        - source: salt://kafka/files/kafka-broker.service.jinja
        - template: jinja
        - context:
            kafka_settings: {{ kafka_settings }}

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: kafka_systemd_unit

kafka_enabled:
    service.enabled:
        - name: kafka-broker
        - watch:
            - module: kafka_systemd_unit
