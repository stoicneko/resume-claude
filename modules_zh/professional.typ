#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry-start, cv-entry-continued, cv-entry

#cv-section("工作经历")

#cv-entry-start(
  society: [*字节跳动*],
  location: [北京],
)

#cv-entry-continued(
  title: [高级 SRE 工程师 · 基础架构],
  date: [2022/03 - 至今],
  description: list(
    [设计多集群生命周期管理平台（Cluster API），集群部署从 2 天缩短至 30 分钟，管理 50+ 集群 / 8000+ 节点],
    [构建自动扩缩容策略，年节省云资源成本 \$2M（降低 30%）],
    [搭建统一可观测性平台（metrics/logs/traces），MTTR 从 45min 降至 8min，告警噪声减少 80%],
  ),
  tags: ("Kubernetes", "Go", "Terraform", "Prometheus", "ArgoCD"),
)

#cv-entry(
  title: [SRE 工程师 · 容器服务 ACK],
  society: [*阿里云*],
  date: [2020/07 - 2022/02],
  location: [杭州],
  description: list(
    [负责托管 K8s 集群稳定性保障（10,000+ 企业客户），可用性从 99.9% 提升至 99.99%],
    [开发自动故障自愈系统，覆盖 Top 20 故障场景，人工介入减少 60%],
    [主导容量规划优化，资源利用率提升 25%，年节省 ¥500W],
  ),
  tags: ("Kubernetes", "Linux", "Docker", "Terraform", "Python"),
)
