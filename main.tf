locals {
  helm_chart_repository       = "https://helm.neo4j.com/neo4j"
  helm_chart_name_neo4j       = "neo4j"
  helm_chart_name_neo4j_lb    = "neo4j-loadbalancer"
  helm_chart_version          = "5.17.0"
  namespace                   = var.namespace
  ssl_certificate_secret_name = "neo4j-ssl-certificate"
  service_account_name        = "neo4j"
  memory_heap_pagecache       = "${floor(tonumber(replace(var.neo4j_resources_resources_memory, "Gi", "")) * 0.3)}gb"

}

resource "kubernetes_namespace_v1" "namespace" {
  count = var.enabled ? 1 : 0
  metadata {
    labels = var.k8s_labels
    name   = var.namespace
  }
}
