#!/bin/bash
. ./scripts/env_variables.sh

# sqlplus command to delete user schema in oci ADW.
sqlplus $sql_username/$sql_pwd@$sql_adw_level << !
  whenever SQLERROR exit SQL.SQLCODE;
  @${WORKSPACE}/scripts/delete_user.sql ${INSTANCE_NAME}
!
if [[ $? -ne 0 ]]
then
   exit 1  
fi
rm -f ${WORKSPACE}/scripts/killsession.sql