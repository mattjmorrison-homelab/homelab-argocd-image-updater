Argo CD Image Updater (v1.3.0), deployed into the argocd namespace per the
project's recommended install option (Role/RoleBinding, no cross-namespace
RBAC needed since Applications also live in argocd).

manifests/ is the official install bundle (config/install.yaml at v1.3.0)
split into one file per resource kind, with the registries.conf and
git.commit-message-template keys populated in configmap.yaml. Nothing else
was changed from the upstream bundle.

Watches homelab-hdmi-switch's Application via an ImageUpdater CR
(homelab-hdmi-switch repo), using write-back method "argocd" - parameter
overrides only, no git commits ever.

Zot registry read credentials: see manifests/secret-store.yaml and
external-secret.yaml, sourced from OpenBao at homelab/argocd-image-updater.
