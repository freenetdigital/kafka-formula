{% from 'kafka/map.jinja' import kafka with context %}

create_kafka_group:
    group.present:
        - name: {{ kafka.group }}
        - system: True

create_kafka_user:
    user.present:
        - name: {{ kafka.user }}
        - groups:
            - {{ kafka.group }}
        - fullname: Kafka User
        - shell: /bin/bash
        - empty_password: True
        - system: True
        - home: {{ kafka.home }}
        - require:
            - group: create_kafka_group
