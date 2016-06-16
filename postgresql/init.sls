include:
  - .package

postgres-service-on-boot:
  service.running:
    - name: postgresql-{{salt.pillar.get('postgresql:version', default_pg_version)}}
    - enable: True
    - require:
      - pkg: postgresql-{{salt.pillar.get('postgresql:version', default_pg_version)}}

{% if salt.pillar.get('postgresql', False) %}
{% for name, user in salt.pillar.get('postgresql:users', {}).iteritems() %}
create-pg-user-{{ name }}:
  postgres_user.present:
    - name: {{ name }}
    - password: {{ user.password }}
    - createuser: {{ user.get('createuser', False) }}
    - createroles: {{ user.get('createroles', False) }}
    - createdb: {{ user.get('createdb', False) }}
    - superuser: {{ user.get('superuser', False) }}
    - encrypted: True
    - login: {{ user.get('login', False) }}
    - require:
      - pkg: postgresql-{{salt.pillar.get('postgresql:version', default_pg_version)}}
{% endfor %}

{% for name, database in salt.pillar.get('postgresql:databases', {}).iteritems() %}
create-pg-db-{{ name }}:
  postgres_database.present:
    - name: {{ name }}
    - user: {{ database.get('owner', 'postgres') }}
    - template: {{ database.get('template', 'template0') }}
    - require:
      - pkg: postgresql-{{salt.pillar.get('postgresql:version', default_pg_version)}}
      - postgres_user: {{ database.get('owner', 'postgres') }}
{% endfor %}
{% endif %}
