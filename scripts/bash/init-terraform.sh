#!/bin/bash

environment=$TF_VAR_environment

realm=$TF_VAR_realm

region=$TF_VAR_aws_region

repo=$(git remote -v | head -n1 | sed -e's/.*\/\([^\.]*\)\.git.*/\1/')

echo "environment = $environment"
echo "realm = $realm"
echo "repo = $repo"
echo "region = $region"

rm .terraform/terraform.tfstate* 2>/dev/null

terraform_version=`terraform --version | head -1 | cut -d' ' -f2`

if [[ "${terraform_version}" =~ "v0.9" ]] ; then

	terraform init \
	    -backend=true \
			-get=true \
	    -backend-config="bucket=sm.terraform-state.${realm}.${region}" \
	    -backend-config="key=${repo}/${environment}/terraform.tfstate" \
	    -backend-config="region=${region}"

else

	terraform remote config \
	    -backend=s3 \
	    -backend-config="bucket=sm.terraform-state.${realm}.${region}" \
	    -backend-config="key=${repo}/${environment}/terraform.tfstate" \
	    -backend-config="region=${region}"
fi
