#import "@preview/brilliant-cv:3.2.0": cv-section, cv-skill, h-bar

#cv-section("Skills")

#cv-skill(
  type: [Cloud Native],
  info: [Kubernetes #h-bar() Docker #h-bar() Containerd #h-bar() Helm #h-bar() Istio #h-bar() Cluster API],
)

#cv-skill(
  type: [IaC & GitOps],
  info: [Terraform #h-bar() Ansible #h-bar() ArgoCD #h-bar() FluxCD #h-bar() Pulumi],
)

#cv-skill(
  type: [Observability],
  info: [Prometheus #h-bar() Grafana #h-bar() OpenTelemetry #h-bar() ClickHouse #h-bar() ELK],
)

#cv-skill(
  type: [Languages],
  info: [Go (primary) #h-bar() Python #h-bar() Bash #h-bar() Rust],
)

#cv-skill(
  type: [OS & Network],
  info: [Linux (kernel tuning, eBPF, cgroups) #h-bar() TCP/IP #h-bar() DNS #h-bar() iptables],
)
