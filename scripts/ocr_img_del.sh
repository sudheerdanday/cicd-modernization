#!/bin/bash
. ./scripts/env_variables.sh

sel_version=${VERSION}

oci artifacts container image list --compartment-id ocid1.compartment.oc1..aaaaaaaaloxhapeicyyjz7nq5kuiojitb43uxitwobso7l5xq6emcmibaoiq  --repository-id  ocid1.containerrepo.oc1.ap-mumbai-1.0.idgrosnf0lwv.aaaaaaaa567jomboautlxf5fsg5djujuhsob53qggowbb7fmvrs3sk6mu3uq --region ap-mumbai-1 > mono_img_data.json
jq '.data.items' mono_img_data.json > mono_img_list.json
mono_img_id=$(jq -r --arg sel_version "$sel_version" '.[] | select(.version==$sel_version)' mono_img_list.json | jq '."id"')
if [ ! -z "$mono_img_id" -a "$mono_img_id" != " " ];
then
    mono_img_ocid=$(echo $mono_img_id | tr -d '"')
    oci artifacts container image delete --image-id $mono_img_ocid --region ap-mumbai-1 --force
    echo "old mono image deleted and re-building..."
    if [[ $? -ne 0 ]]
    then
        echo "Existing mono image not deleted"
        exit 1  
    fi
else
    echo "mono image not exists and newly creating..."
fi

oci artifacts container image list --compartment-id ocid1.compartment.oc1..aaaaaaaaloxhapeicyyjz7nq5kuiojitb43uxitwobso7l5xq6emcmibaoiq  --repository-id  ocid1.containerrepo.oc1.ap-mumbai-1.0.idgrosnf0lwv.aaaaaaaaaf3o6zpzsqvcgyarwymkijnnz2btwuxxl22r7fng6otnek27kwna --region ap-mumbai-1 > home_sync_img_data.json
jq '.data.items' home_sync_img_data.json > home_sync_img_list.json
home_sync_img_id=$(jq -r --arg sel_version "$sel_version" '.[] | select(.version==$sel_version)' home_sync_img_list.json | jq '."id"')
if [ ! -z "$home_sync_img_id" -a "$home_sync_img_id" != " " ];
then
    home_sync_img_ocid=$(echo $home_sync_img_id | tr -d '"')
    oci artifacts container image delete --image-id $home_sync_img_ocid --region ap-mumbai-1 --force
    echo "old home_sync image deleted and re-building..."
    if [[ $? -ne 0 ]]
    then
        echo "Existing home_sync image not deleted"
        exit 1  
    fi
else
    echo "home_sync image not exists and newly creating..."
fi

rm -rf home_sync* mono_img*