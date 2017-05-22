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
        - shell: /bin/false
        - empty_password: True
        - system: True
        - home: /var/lib/{{ kafka.user }}
        - require:
            - group: create_kafka_group
