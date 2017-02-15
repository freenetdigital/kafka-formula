{% from 'kafka/map.jinja' import kafka_settings with context %}

delete_systemd_unit:
    service.dead:
        - name: kafka-broker
        - enable: False

    file.absent:
        - name: /etc/systemd/system/kafka-broker.service

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: delete_systemd_unit

delete_kafka_user:
    user.absent:
        - name: {{ kafka_settings.env.user }}

delete_kafka_group:
    group.absent:
        - name: {{ kafka_settings.env.group }}
        - require:
            - user: delete_kafka_user

delete_kafka_dirs:
    file.absent:
        - names:
            - /opt/kafka_{{ kafka_settings.version.scala }}-{{ kafka_settings.version.kafka }}
            - /opt/kafka
