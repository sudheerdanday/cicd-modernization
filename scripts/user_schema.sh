#!/bin/bash
. ./scripts/env_variables.sh

# username=${INSTANCE_NAME}
# password="${username:0:3}Orbit#1234"

# sqlplus command to create user schema in oci ADW.
# sqlplus $sql_username/$sql_pwd@$sql_adw_level << !
#   whenever SQLERROR exit SQL.SQLCODE;
#   @${WORKSPACE}/scripts/create_user.sql $username $password
# !
# if [[ $? -ne 0 ]]
# then
#    exit 1  
# fi
sqlplus 'admin@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=database-1.cx0g3ko3kktr.us-west-2.rds.amazonaws.com)(PORT=1521))(CONNECT_DATA=(SID=DATABASE)))'
