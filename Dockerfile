FROM 32bit/ubuntu:16.04

ADD setup.sh /setup.sh

ENTRYPOINT ["/setup.sh"]

