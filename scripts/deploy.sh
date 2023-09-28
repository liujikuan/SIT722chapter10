#
# Provision a Kubernetes cluster to host a microservices application.
#

set -u # or set -o nounset
: "$VERSION"
: "$ARM_CLIENT_ID"
: "$ARM_CLIENT_SECRET"
: "$STORAGE_ACCOUNT_NAME"
: "$STORAGE_ACCESS_KEY"

cd ./scripts
#export KUBECONFIG="./scripts/kubeconfig"
# export KUBERNETES_SERVICE_HOST="" # Workaround for https://github.com/terraform-providers/terraform-provider-kubernetes/issues/679
terraform init -backend-config="access_key=$STORAGE_ACCESS_KEY"
export TF_LOG="DEBUG"
# --auto-approve
terraform apply -auto-approve \
    -var "app_version=$VERSION" \
    -var "client_id=$ARM_CLIENT_ID" \
    -var "client_secret=$ARM_CLIENT_SECRET" \
    -var "storage_account_name=$STORAGE_ACCOUNT_NAME" \
    -var "storage_access_key=$STORAGE_ACCESS_KEY"
