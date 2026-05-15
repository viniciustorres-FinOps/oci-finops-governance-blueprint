resource "oci_budget_budget" "finops_prod_budget" {
  compartment_id = var.tenancy_ocid
  
  # O segredo do FinOps: monitorar o compartimento isolado que criamos
  target_compartment_id = oci_identity_compartment.finops_prod_compartment.id
  
  description    = "Monthly budget tracking for PROD-FINOPS-RESOURCES"
  amount         = 100
  reset_period   = "MONTHLY"
  display_name   = "Prod_Compartment_Monthly_Budget"
}

resource "oci_budget_alert_rule" "alert_80_percent" {
  budget_id      = oci_budget_budget.finops_prod_budget.id
  threshold      = 80
  threshold_type = "PERCENT"
  type           = "ACTUAL"
  
  message        = "WARNING: FinOps Alert - OCI cost usage has exceeded 80% of the allocated monthly budget for PROD."
  recipients     = "vinicius.torres@icloud.com"
  display_name   = "80_Percent_Budget_Threshold_Alert"
}
