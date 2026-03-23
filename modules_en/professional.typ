#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry-start, cv-entry-continued, cv-entry

#cv-section("Professional Experience")

#cv-entry-start(
  society: [*ByteDance*],
  location: [Beijing],
)

#cv-entry-continued(
  title: [Senior SRE Engineer — Infrastructure],
  date: [2022/03 - Present],
  description: list(
    [Architected multi-cluster lifecycle management platform with Cluster API, reducing cluster deployment from 2 days to 30 minutes across 50+ clusters (8000+ nodes, 3 regions)],
    [Built automated scaling strategy based on workload forecasting, saving \$2M/year in cloud costs (30% reduction)],
    [Designed unified observability platform integrating metrics/logs/traces, reducing MTTR from 45min to 8min],
    [Developed intelligent alert aggregation engine, cutting alert noise by 80% across 500+ microservices],
  ),
  tags: ("Kubernetes", "Go", "Terraform", "Prometheus", "ArgoCD", "OpenTelemetry"),
)

#cv-entry(
  title: [SRE Engineer — Container Service (ACK)],
  society: [*Alibaba Cloud*],
  date: [2020/07 - 2022/02],
  location: [Hangzhou],
  description: list(
    [Defined and implemented SLO framework for managed Kubernetes service serving 10,000+ enterprise customers],
    [Built automated self-healing system covering Top 20 failure scenarios, achieving 85% auto-recovery rate],
    [Improved cluster availability from 99.9% to 99.99%, reducing manual intervention by 60%],
    [Led capacity planning optimization, increasing resource utilization by 25% (¥5M/year savings)],
  ),
  tags: ("Kubernetes", "Linux", "Docker", "Terraform", "Ansible", "Python"),
)
