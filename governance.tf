# 1. Criação do Compartimento Isolado para Produção
resource "oci_identity_compartment" "finops_prod_compartment" {
  compartment_id = var.tenancy_ocid
  description    = "Production compartment with strict FinOps cost controls"
  name           = "PROD-FINOPS-RESOURCES"
  enable_delete  = false # Trava de segurança contra deleção acidental
}

# 2. Namespace de Governança para agrupar as Tags de Custo
resource "oci_identity_tag_namespace" "finops_tags" {
  compartment_id = var.tenancy_ocid
  description    = "Required tags for cost allocation and tracking"
  name           = "Governance"
}

# 3. Tag Obrigatória de Centro de Custo
resource "oci_identity_tag" "cost_center" {
  description      = "Identifies the cost center responsible for the resource"
  name             = "CostCenter"
  tag_namespace_id = oci_identity_tag_namespace.finops_tags.id
  
  # Ativa o rastreamento de custos nativo do OCI para esta Tag
  is_cost_tracking = true 
}
