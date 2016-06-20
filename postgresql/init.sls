include:
  - .package

postgres-service-on-boot:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: postgresql-install

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
      - pkg: postgresql-install
{% endfor %}

{% for name, database in salt.pillar.get('postgresql:databases', {}).iteritems() %}
create-pg-db-{{ name }}:
  postgres_database.present:
    - name: {{ name }}
    - owner: {{ database.get('owner', 'postgres') }}
    - template: {{ database.get('template', 'template0') }}
    - require:
      - pkg: postgresql-install
      - postgres_user: create-pg-user-{{ database.get('owner', 'postgres') }}
{% endfor %}
{% endif %}
