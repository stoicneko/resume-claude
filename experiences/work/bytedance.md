---
company: 字节跳动
company_en: ByteDance
url: https://bytedance.com
location: 北京
location_en: Beijing
period: 2022/03 -- 至今
department: 基础架构
department_en: Infrastructure
role: 高级 SRE 工程师
role_en: Senior SRE Engineer
tags: [kubernetes, terraform, prometheus, go, python]
logo: logos/bytedance.png
---

# Kubernetes 多集群管理平台
> 2023/06 - 至今 | 技术负责人

## 项目背景
公司业务快速增长，需要统一管理分布在 3 个区域的 50+ Kubernetes 集群，总计 8000+ 节点。

## 核心工作
- 设计并实现基于 Cluster API 的多集群生命周期管理平台
- 开发自动化集群扩缩容策略，基于业务负载预测自动调整节点数量
- 构建统一的集群配置管理系统，使用 GitOps 模式管理集群配置

## 量化成果
- 集群部署时间从 2 天缩短到 30 分钟
- 节省 30% 云资源成本（约 $2M/年）
- 集群配置变更错误率降低 95%

## 技术栈
Go, Kubernetes, Cluster API, ArgoCD, Terraform, Prometheus

# 可观测性平台建设
> 2022/03 - 2023/05 | 核心开发

## 项目背景
原有监控系统碎片化严重，告警噪声大，MTTR 高。

## 核心工作
- 构建统一可观测性平台，整合 metrics/logs/traces 三大支柱
- 开发智能告警聚合引擎，降低告警噪声
- 实现自动化根因分析工具，加速故障定位

## 量化成果
- MTTR 从 45 分钟降低到 8 分钟
- 告警噪声减少 80%
- 覆盖 500+ 微服务的全链路追踪

## 技术栈
Prometheus, Grafana, OpenTelemetry, ClickHouse, Go
