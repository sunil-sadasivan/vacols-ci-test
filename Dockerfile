FROM store/oracle/database-enterprise:12.2.0.1-slim

COPY vacols_copy* /ORCL/
COPY setup_vacols.sql /ORCL/
COPY dockerInitWithoutWait.sh /home/oracle/setup/dockerInitWithoutWait.sh
# COPY dockerInitSafeWait.sh /home/oracle/setup/dockerInitSafeWait.sh

ENV DB_SID=BVAP

RUN mkdir -p /u01/app/oracle/oradata/BVAP 

RUN ["/bin/bash", "-c", "/home/oracle/setup/dockerInitWithoutWait.sh"]
# RUN ["bin/bash", "-c", "source /home/oracle/.bashrc; sqlplus sys/Oradoc_db1 as SYSDBA @/ORCL/setup_vacols.sql"]
