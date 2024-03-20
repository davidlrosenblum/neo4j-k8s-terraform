resource "helm_release" "neo4j-core-1" {
  name       = "core-1"
  chart      = "neo4j/neo4j"
  namespace        = "efs"
  create_namespace = false
  force_update     = true
  atomic           = false
  reuse_values     = false
  recreate_pods    = false
  timeout          = 120
  wait             = true
  values = [
    "${file("neo4j.values.yaml")}"
  ]
 
}