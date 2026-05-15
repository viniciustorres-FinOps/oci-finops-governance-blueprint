# oci-finops-governance-blueprint
Governance and FinOps Structure for OCI using Terraform and Policies-as-Code
## Professional Implementation of FinOps for OCI

This project demonstrates a professional FinOps implementation for Oracle Cloud Infrastructure (OCI), focused on scalability and rigorous cost control.

### Technical Pillars:

* **Isolation Strategy:** Use of hierarchical Compartments for cost isolation.
* **Defined Tags Enforcement:** Terraform code that prevents the creation of resources without a designated CostCenter.
* **Budget Automation:** Configuration of budget alerts via code.

## How to Validate (Cost-Free Governance Simulation)

To verify the syntax and logical dependency mapping of this blueprint without provision cost or deploying live resources, run the following simulation:

```bash
terraform init
terraform plan -var="tenancy_ocid=YOUR_TENANCY_OCID_HERE"
