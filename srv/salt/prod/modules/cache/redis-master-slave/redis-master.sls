include:
  - modules.database.redis-master-slave.install 


provide-file:
  file.managed:
    - names: 
      - /usr/local/redis/conf/redis.conf:
        - source: salt://modules/database/redis-master-slave/files/redis.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_server.service:
        - source: salt://modules/database/redis-master-slave/files/redis_server.service
      - /usr/local/redis/conf/sentinel.conf:
        - source: salt://modules/database/redis-master-slave/files/master-sentinel.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_sentinel.service:
        - source: salt://modules/database/redis-master-slave/files/redis_sentinel.service
   

redis_server.service:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: provide-file

redis_sentinel.service:
  service.running:
    - enable: true
    - reload: true





