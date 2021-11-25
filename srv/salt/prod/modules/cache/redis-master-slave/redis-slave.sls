include:
  - modules.database.redis-master-slave.install


provide-program-conf:
  file.managed:
    - names:
      - /usr/local/redis/conf/redis.conf:
        - source: salt://modules/database/redis-master-slave/files/redis-slave.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_server.service:
        - source: salt://modules/database/redis-master-slave/files/redis_server.service
      - /usr/local/redis/conf/sentinel.conf:
        - source: salt://modules/database/redis-master-slave/files/slave-sentinel.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_sentinel.service:
        - source: salt://modules/database/redis-master-slave/files/r
edis_sentinel.service


redis_server.service:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: provide-program-conf

redis_sentinel.service:
  service.running:
    - enable: true
    - reload: true






