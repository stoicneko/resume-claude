#import "@preview/brilliant-cv:3.2.0": cv-section, cv-skill, h-bar

#cv-section("技能")

#cv-skill(
  type: [云原生],
  info: [Kubernetes #h-bar() Docker #h-bar() Helm #h-bar() Istio #h-bar() Cluster API],
)

#cv-skill(
  type: [IaC & GitOps],
  info: [Terraform #h-bar() Ansible #h-bar() ArgoCD #h-bar() FluxCD],
)

#cv-skill(
  type: [可观测性],
  info: [Prometheus #h-bar() Grafana #h-bar() OpenTelemetry #h-bar() ClickHouse #h-bar() ELK],
)

#cv-skill(
  type: [编程语言],
  info: [Go (主力) #h-bar() Python #h-bar() Bash #h-bar() Rust],
)

#cv-skill(
  type: [系统 & 网络],
  info: [Linux (内核调优, eBPF, cgroups) #h-bar() TCP/IP #h-bar() DNS],
)
