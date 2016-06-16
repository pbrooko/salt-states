oracle-java8-repo:
  pkgrepo.managed:
    - humanname: WebUp8Team Java Repository
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main
    - file: /etc/apt/sources.list.d/java8-webupd8team.list
    - keyid: EEA14886
    - keyserver: keyserver.ubuntu.com
    - refresh_db: True
