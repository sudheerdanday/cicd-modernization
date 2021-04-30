#!/bin/bash
. ./scripts/env_variables.sh
cd terraform/tf_environment

/usr/local/bin/terraform get -update
/usr/local/bin/terraform init
/usr/local/bin/terraform fmt
/usr/local/bin/terraform validate
/usr/local/bin/terraform plan -out=terraform.tfplan
#/usr/local/bin/terraform apply -var "customer_name=${INSTANCE_NAME}" -var "export_path=/${INSTANCE_NAME}" -var "need_subnet=${NEED_SUBNET}" -lock=false -auto-approve
/usr/local/bin/terraform apply -lock=false -auto-approve
if [[ $? -ne 0 ]]
then
   exit 1  
fi
mkdir -p ./${ENV_TYPE}/${INSTANCE_NAME}
chmod 755 ./${ENV_TYPE}/${INSTANCE_NAME}
cp -r ./terraform.tfplan ./${ENV_TYPE}/${INSTANCE_NAME}
cp -r ./terraform.tfstate ./${ENV_TYPE}/${INSTANCE_NAME}
rm -rf ./.terraform* ./terraform*

# if [[ -f $cidr_file && -f $dynamic_cidr_file ]]; then
#     cp  $cidr_file $dynamic_cidr_file ./${ENV_TYPE}/${INSTANCE_NAME}
# fi

# rm -rf $cidr_file $dynamic_cidr_file
