{%- macro source_url() -%}
{%- set k = salt['pillar.get']('kafka:kafka_version', '0.10.2.1') -%}
{%- set s = salt['pillar.get']('kafka:scala_version', '2.12') -%}
{%- set m = salt['pillar.get']('kafka:mirror', 'https://dist.apache.org/repos/dist/release') -%}
{{ m }}/kafka/{{ k }}/kafka_{{ s }}-{{ k }}.tgz
{%- endmacro -%}

{%- macro source_hash() -%}
{%- set k = salt['pillar.get']('kafka:kafka_version', '0.10.2.1') -%}
{%- set s = salt['pillar.get']('kafka:scala_version', '2.12') -%}
{%- set sha = salt['pillar.get']('kafka:sha', 'sha512') -%}
{%- set m = 'https://dist.apache.org/repos/dist/release' -%}
{{ m }}/kafka/{{ k }}/kafka_{{ s }}-{{ k }}.tgz.{{ sha }}
{%- endmacro -%}
