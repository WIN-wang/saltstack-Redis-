redis-dep-pkg-install:
  pkg.installed:
    - pkgs:
      - systemd-devel
      - tcl-devel
      - gcc
      - gcc-c++
      - make

unzip-redis:
  archive.extracted:
    - name: /usr/src
    - source: salt://modules/database/redis/files/redis-6.2.6.tar.gz
    - if_missing: /usr/src/redis-6.2.6

install-redis:
  cmd.script:
    - name: salt://modules/database/redis-master-slave/files/install.sh


/usr/local/redis/conf:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - makedirs: true



