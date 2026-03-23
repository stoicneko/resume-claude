#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry

#cv-section("开源项目")

#cv-entry(
  title: [k8s-doctor],
  society: [GitHub 1.2k stars],
  date: [2023],
  location: [],
  description: list(
    [K8s 集群一键诊断工具，覆盖 50+ 常见问题，支持离线模式],
  ),
  tags: ("Go", "client-go", "cobra"),
)

#cv-entry(
  title: [prom-alert-manager],
  society: [开源],
  date: [2022],
  location: [],
  description: list(
    [智能告警聚合引擎，基于拓扑关系自动关联告警，降噪 70%+],
  ),
  tags: ("Go", "Prometheus", "gRPC"),
)
