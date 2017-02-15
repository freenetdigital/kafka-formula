{% from 'kafka/map.jinja' import kafka_settings with context %}

download_and_extract_kafka_tarball:
    archive.extracted:
        - name: /opt/
        - if_missing: /opt/kafka
        - source: http://mirror.nohup.it/apache/kafka/{{ kafka_settings.version.kafka }}/kafka_{{ kafka_settings.version.scala }}-{{ kafka_settings.version.kafka }}.tgz
        - source_hash: {{ kafka_settings.version.source_hash }}
        - archive_format: tar
        - user: {{ kafka_settings.env.user }}
        - group: {{ kafka_settings.env.group }}

    file.symlink:
        - name: /opt/kafka
        - target: /opt/kafka_{{ kafka_settings.version.scala }}-{{ kafka_settings.version.kafka }}
        - user: {{ kafka_settings.env.user }}
        - group: {{ kafka_settings.env.group }}
