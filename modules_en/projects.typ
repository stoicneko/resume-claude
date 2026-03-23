#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry

#cv-section("Projects")

#cv-entry(
  title: [k8s-doctor],
  society: [Open Source · 1.2k stars],
  date: [2023],
  location: [],
  description: list(
    [One-click Kubernetes cluster health diagnostics covering 50+ common issues, with offline mode for air-gapped environments],
  ),
  tags: ("Go", "client-go", "cobra"),
)

#cv-entry(
  title: [prom-alert-manager],
  society: [Open Source],
  date: [2022],
  location: [],
  description: list(
    [Intelligent alert aggregation engine using topology-aware correlation, reducing alert volume by 70%+],
  ),
  tags: ("Go", "Prometheus", "gRPC"),
)
