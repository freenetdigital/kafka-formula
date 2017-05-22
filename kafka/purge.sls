{% from 'kafka/map.jinja' import kafka with context %}

delete_systemd_unit:
    service.dead:
        - name: {{ kafka.service }}
        - enable: False

    file.absent:
        - name: /etc/systemd/system/{{ kafka.service }}.service

    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: delete_systemd_unit

delete_kafka_user:
    user.absent:
        - name: {{ kafka.user }}

delete_kafka_group:
    group.absent:
        - name: {{ kafka.group }}
        - require:
            - user: delete_kafka_user

delete_kafka_dirs:
    file.absent:
        - names:
            - /opt/kafka
            - /var/lib/{{ kafka.user }}
            - {{ kafka.server_conf.get('log.dirs') }}
