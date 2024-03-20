provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "neo4j-core-2" {
  name       = "core-2"
  chart      = "neo4j/neo4j"

  values = [
    "${file("neo4j.values.yaml")}"
  ]
}
