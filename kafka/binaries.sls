{% from 'kafka/map.jinja' import kafka with context %}
{% from 'kafka/macro.sls' import source_url with context %}
{% from 'kafka/macro.sls' import source_hash with context %}

download_and_extract_kafka_tarball:
{% if salt['pillar.get']('kafka:mirror') != 'salt://' %}
    cmd.run:
        - name: "curl -s {{ source_hash() }} | sed -e 's/.*://g' -e 's/ //g' | tr -d '\n' | tr [:upper:] [:lower:] > /tmp/kafka.sha2"
{% endif %}

    archive.extracted:
        - name: {{ kafka.home }}
        - if_missing: {{ kafka.home }}
        - source: {{ source_url() }}
{% if salt['pillar.get']('kafka:mirror') != 'salt://' %}
        - source_hash: /tmp/kafka.sha2
{% endif %}
        - archive_format: tar
        - options: "--strip=1"
        - enforce_toplevel: False
        - user: {{ kafka.user }}
        - group: {{ kafka.group }}
