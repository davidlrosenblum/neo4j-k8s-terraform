provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "neo4j-core-3" {
  name       = "core-3"
  chart      = "neo4j/neo4j"

  values = [
    "${file("neo4j.values.yaml")}"
  ]
}
