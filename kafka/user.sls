{% from 'kafka/map.jinja' import kafka_settings with context %}

create_kafka_group:
    group.present:
        - name: {{ kafka_settings.env.group }}
        - system: True

create_kafka_user:
    user.present:
        - name: {{ kafka_settings.env.user }}
        - groups:
            - {{ kafka_settings.env.group }}
        - fullname: Kafka User
        - shell: /bin/bash
        - empty_password: True
        - system: True
        - require:
            - group: create_kafka_group
