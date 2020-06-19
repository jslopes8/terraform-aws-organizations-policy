variable "name" {
    type    = string
}
variable "description" {
    type    = string
    default = null
}
variable "type" {
    description = "O tipo de política a ser criada. Atualmente, os únicos valores válidos são SERVICE_CONTROL_POLICY(SCP) e TAG_POLICY. O padrão é SERVICE_CONTROL_POLICY."
    type    = string
    default = "SERVICE_CONTROL_POLICY"
}
variable "statement" {
    type    = any
    default = []
}