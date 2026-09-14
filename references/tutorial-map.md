---
title: "文档阅读指引"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/tutorial-map.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

在开始您的阅读前，请先查看本节，了解当前教程文档的结构与内容、获得阅读指引。

## 阅读公告

- 我们暂不提供 DJI Pilot 2 单独的安装包，将它内置在遥控器固件包中。DJI Pilot 2 安装方式：[Pilot2 怎么安装？哪里能够获取到安装包？](https://sdk-forum.dji.net/hc/zh-cn/articles/6177232395801-Pilot2-%E6%80%8E%E4%B9%88%E5%AE%89%E8%A3%85-%E5%93%AA%E9%87%8C%E8%83%BD%E5%A4%9F%E8%8E%B7%E5%8F%96%E5%88%B0%E5%AE%89%E8%A3%85%E5%8C%85-)。
- 我们整理了用户在实践过程中可能会出现的疑问并给出了对应的解答与指导，同时对教程文档的内容进行了补充说明。请查看[知识库](https://sdk-forum.dji.net/hc/zh-cn/categories/900001352083-%E4%B8%8A%E4%BA%91API)。
- 若您对文档内容有什么疑问，请点击任意页面右下角的“文档反馈”标志，反馈您的问题并留下您的邮箱，我们将与您联系。
- 若您有技术问题，请通过[DJI 技术支持社区](https://sdk-forum.dji.net/hc/zh-cn)反馈或者[提交表单](https://sdk-forum.dji.net/hc/zh-cn/requests/new)，会有技术人员跟进您的问题。

## 文档阅读地图

- 我们将 “产品类型枚举“ 置于基本介绍中的 [产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)。
- 我们将 “航线文件格式” 置于 API 介绍中的[DJI WPML](https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dji-wpml/overview.html)。

![](https://terra-1-g.djicdn.com/71a7d383e71a4fb8887a310eb746b47f/cloudapi/v1.6/cloudapi-map.png)

## API 总览

- 当前仅机场支持 `设备属性设置` 与 `设置直播镜头` 协议。
- 若用户的云服务无法访问外网（即 WAN），需实现 `配置更新` 功能，下发可被云服务访问的 NTP 服务的 URL，以实现时钟同步，否则航线任务将无法正常执行。
- 航线相关协议中，`创建航线任务`已废弃，请使用`下发任务`与`执行任务`。

![](https://terra-1-g.djicdn.com/71a7d383e71a4fb8887a310eb746b47f/cloudapi/v1.6/cloud-api-overview.png)

## 功能集合

| 功能 | Pilot 接口实现 | 机场接口实现 |
| --- | --- | --- |
| Pilot 与云端连接 | App端 API（JSBridge）：；License 认证；加载功能模块-API 模块；获取 Token；加载功能模块-设备上云模块；设置工作空间 ID；设置平台名称； | - |
| 机场与云端连接 | - | 云端API（MQTT）：；获取设备绑定信息；查询设备绑定对应的组织信息；使用设备绑定码绑定对应组织； |
| 态势感知 | App端 API（JSBridge）：；加载功能模块-加载态势感知模块；；云端 API（HTTPS）：；获取设备拓扑列表；自定义图标；设备状态推送；设备拓扑更新；；云端 API（WebSocket）：；消息发布 | - |
| 设备管理 | 待整理 | 云端API（MQTT）：；设备属性推送；设备拓扑更新；设备属性设置 |
| 直播功能 | App端 API（JSBridge）：；加载功能模块-直播模块；；云端API（MQTT）：；直播能力更新；开始直播；停止直播；设置直播清晰度；；App端 API（JSBridge）：；App端 手动发起直播 | 云端API（MQTT）：；直播能力更新；开始直播；停止直播；设置直播清晰度；设置直播镜头； |
| 地图元素 | App端 API（JSBridge）：；加载功能模块-地图元素模块；；云端API（HTTPS）：；获取地图元素；创建地图元素；更新地图元素；删除地图元素；；云端API（WebSocket）：；地图元素 - 消息发布； | - |
| 媒体管理 | App端 API（JSBridge）：；加载功能模块-加载媒体模块；；云端API（HTTPS）：；文件快传；获取已经存在的文件精简指纹；获取上传临时凭证；媒体文件上传结果上报； | 云端API（MQTT）：；获取上传临时凭证；媒体文件上传结果上报 |
| 航线管理 | App端 API（JSBridge）：；加载功能模块-航线模块；；云端API（HTTPS）：；获取上传临时凭证；获取航线文件列表；获取航线文件下载地址；获取重复的航线文件名称；航线文件上传结果上报；批量收藏航线文件；批量取消收藏航线文件； | 云端API（MQTT）：；创建航线任务(废弃)；上报飞行任务进度和状态；下发任务；执行任务；取消任务；任务资源获取 |
| 跳转第三方 App | App端 API（JSBridge）：；跳转到第三方 App | - |
| 通过 JSBridge 获取日志 | App端 API（JSBridge）：；获取日志路径；设置日志加密 key；清除日志加密 key | - |
| HMS 功能 | - | 云端API (MQTT)：；健康告警 |
| 远程调试 | - | 云端API (MQTT)：；任务进度；命令；任务 |
| 固件升级 | - | 云端API (MQTT)：；固件升级进度；固件升级 |
| 远程日志 | - | 云端API (MQTT)：；获取设备可上传的文件列表；发起日志文件上传；上传状态更新；文件上传进度通知； |
| 指令飞行 | - | 云端API (MQTT)：；飞行控制类指令（DRC 指令）；负载控制类指令；flyto 指令；一键起飞指令 |
