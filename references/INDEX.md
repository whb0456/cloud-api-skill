# DJI 上云API 文档总目录（INDEX）

> 快照：developer.dji.com 上云API v1.16.1，抓取于 2026-09。共 145 页。
> 用法：按标题/关键词定位页面 → 读取对应 md 文件。每页 frontmatter 含官网原始 URL。
> 各机场(dock1/2/3)与各机型(m30/m3d/m4d)的同名模块内容不同，注意选择正确机型目录。
> HMS 告警文案：`api-reference/dock-to-cloud/mqtt/dock/hms.json`（3952 条官方文案，zh/en 等多语言），拼接规则见 feature-set/dock-feature-set/hms.md。

## 产品介绍与基础概念

- **产品介绍** → [overview/product-introduction.md](overview/product-introduction.md)　
  - 小节：概述 / 核心理念
- **产品架构** → [overview/product-architecture.md](overview/product-architecture.md)　
- **产品支持** → [overview/product-support.md](overview/product-support.md)　
  - 小节：机型支持 / 格式说明 / 飞行器/遥控器/机场枚举值 / 相机枚举值
- **名词解释** → [overview/basic-concept/proper-noun.md](overview/basic-concept/proper-noun.md)　
- **MQTT** → [overview/basic-concept/mqtt.md](overview/basic-concept/mqtt.md)　
  - 小节：MQTT 简介 / MQTT 术语 / MQTT 消息模型 / MQTT Topic格式
- **物模型** → [overview/basic-concept/thing-model.md](overview/basic-concept/thing-model.md)　
  - 小节：概述 / 为什么需要物模型 / 物模型文件规范 / 数据触发机制
- **HTTPS** → [overview/basic-concept/https.md](overview/basic-concept/https.md)　
  - 小节：概述 / 接口格式 / 错误码
- **WebSocket** → [overview/basic-concept/websocket.md](overview/basic-concept/websocket.md)　
- **JSBridge** → [overview/basic-concept/jsbridge.md](overview/basic-concept/jsbridge.md)　
  - 小节：概述 / Webview / JSBridge相互调用示例

## 快速开始（Demo 部署）

- **环境准备清单** → [quick-start/environment-prepare-list.md](quick-start/environment-prepare-list.md)　
- **基于源码的部署** → [quick-start/source-code-deployment-steps.md](quick-start/source-code-deployment-steps.md)　
  - 小节：注册成为DJI开发者 / 生成license / 前端服务环境搭建 / 后端服务环境搭建 / Pilot 2登录程序 / Web端登录程序
- **基于Docker的部署** → [quick-start/docker-deployment-steps.md](quick-start/docker-deployment-steps.md)　
  - 小节：Docker 安装 / Docker Compose 安装 / 源码包下载 / 解压文件 / 载入镜像 / 启动容器 / Pilot 2登录程序 / Web端登录程序
- **功能预览视频** → [quick-start/function-display-video.md](quick-start/function-display-video.md)　
  - 小节：Pilot 上云 / 机场上云 / 直播功能 / 地图元素 / 媒体管理 / Pilot 航线管理 / 固件升级 / 远程日志

## 功能集 — DJI Pilot 2

- **Pilot 上云** → [feature-set/pilot-feature-set/pilot-access-to-cloud.md](feature-set/pilot-feature-set/pilot-access-to-cloud.md)　
  - 小节：创建上云API应用示例 / Pilot 上云 / Pilot 下云 / 接口详细实现
- **态势感知** → [feature-set/pilot-feature-set/pilot-situation-awareness.md](feature-set/pilot-feature-set/pilot-situation-awareness.md)　
  - 小节：功能概述 / Pilot 交互时序图 / 接口详细实现
- **直播功能** → [feature-set/pilot-feature-set/pilot-livestream.md](feature-set/pilot-feature-set/pilot-livestream.md)　`thing/product/{gateway_sn}/osd`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`　`thing/product/{gateway_sn}/state`
  - 小节：功能概述 / 支持的直播类型 / 直播总体框架 / 交互时序图 / 接口详细实现
- **地图元素** → [feature-set/pilot-feature-set/pilot-map-elements.md](feature-set/pilot-feature-set/pilot-map-elements.md)　
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **媒体管理** → [feature-set/pilot-feature-set/pilot-media-management.md](feature-set/pilot-feature-set/pilot-media-management.md)　`POST /media/api/v1/workspaces/{workspace_id}/fast-upload`　`POST /media/api/v1/workspaces/{workspace_id}/files/tiny-fingerprints`　`POST /media/api/v1/workspaces/{workspace_id}/upload-callback`　`POST /storage/api/v1/workspaces/{workspace_id}/sts`
  - 小节：功能概述 / 交互时序 / 接口详细实现
- **航线管理** → [feature-set/pilot-feature-set/pilot-wayline-management.md](feature-set/pilot-feature-set/pilot-wayline-management.md)　
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **通过 JSBridge 获取日志** → [feature-set/pilot-feature-set/pull-pilot-log.md](feature-set/pilot-feature-set/pull-pilot-log.md)　
  - 小节：功能概述 / 接口详细实现
- **打开第三方 App** → [feature-set/pilot-feature-set/pilot-third-party-app.md](feature-set/pilot-feature-set/pilot-third-party-app.md)　
  - 小节：功能概述 / 接口详细实现
- **指令飞行/远程控制** → [feature-set/pilot-feature-set/drc.md](feature-set/pilot-feature-set/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细说明

## 功能集 — 机场（Dock）

- **机场上云** → [feature-set/dock-feature-set/dock-access-to-cloud.md](feature-set/dock-feature-set/dock-access-to-cloud.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：概述 / 交互时序 / 接口详细实现
- **设备管理** → [feature-set/dock-feature-set/dock-device-management.md](feature-set/dock-feature-set/dock-device-management.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`　`thing/product/{gateway_sn}/property/set`　`thing/product/{gateway_sn}/property/set_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **直播功能** → [feature-set/dock-feature-set/dock-livestream.md](feature-set/dock-feature-set/dock-livestream.md)　`thing/product/{device_sn}/state`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **媒体管理** → [feature-set/dock-feature-set/dock-media-management.md](feature-set/dock-feature-set/dock-media-management.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：功能概述 / 交互时序 / 接口详细实现
- **航线管理** → [feature-set/dock-feature-set/dock-wayline-management.md](feature-set/dock-feature-set/dock-wayline-management.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **HMS 功能** → [feature-set/dock-feature-set/hms.md](feature-set/dock-feature-set/hms.md)　`thing/product/{gateway_sn}/events`
  - 小节：功能概述 / 交互时序 / 接口详细实现
- **远程调试** → [feature-set/dock-feature-set/remote-debug.md](feature-set/dock-feature-set/remote-debug.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **固件升级** → [feature-set/dock-feature-set/firmware-upgrade.md](feature-set/dock-feature-set/firmware-upgrade.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **远程日志** → [feature-set/dock-feature-set/remote-log.md](feature-set/dock-feature-set/remote-log.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：功能概述 / 交互时序图 / 接口详细说明
- **指令飞行/远程控制** → [feature-set/dock-feature-set/drc.md](feature-set/dock-feature-set/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：功能概述 / 接口详细说明
- **自定义飞行区** → [feature-set/dock-feature-set/custom-flight-area.md](feature-set/dock-feature-set/custom-flight-area.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/services`
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **蛙跳任务** → [feature-set/dock-feature-set/multi-dock.md](feature-set/dock-feature-set/multi-dock.md)　
  - 小节：功能概述 / 交互时序图 / 接口详细实现
- **AI目标识别** → [feature-set/dock-feature-set/ai-target-recognition.md](feature-set/dock-feature-set/ai-target-recognition.md)　
  - 小节：功能概述 / 交互时序图 / 接口详细实现

## API 参考 — DJI WPML 航线文件格式

- **总体介绍** → [api-reference/dji-wpml/overview.md](api-reference/dji-wpml/overview.md)　
  - 小节：背景 / 什么是 WPML / 如何使用 WPML / 已有航线转换
- **template.kml 说明** → [api-reference/dji-wpml/template-kml.md](api-reference/dji-wpml/template-kml.md)　
  - 小节：文件介绍 / 元素说明
- **waylines.wpml 说明** → [api-reference/dji-wpml/waylines-wpml.md](api-reference/dji-wpml/waylines-wpml.md)　
  - 小节：文件介绍 / 元素说明
- **共用元素信息** → [api-reference/dji-wpml/common-element.md](api-reference/dji-wpml/common-element.md)　
  - 小节：信息说明 / 共用元素

## API 参考 — Pilot 上云

- **Topic 定义** → [api-reference/pilot-to-cloud/mqtt/topic-definition.md](api-reference/pilot-to-cloud/mqtt/topic-definition.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：Topic 总览 / 公共字段解释 / osd 结构示例 / state 结构示例 / services 结构示例 / services_reply 结构示例 / events 结构示例 / events_reply 结构示例
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/m3-series/properties.md](api-reference/pilot-to-cloud/mqtt/m3-series/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/m4-series/properties.md](api-reference/pilot-to-cloud/mqtt/m4-series/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/matrice-400/properties.md](api-reference/pilot-to-cloud/mqtt/matrice-400/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/properties.md](api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备管理** → [api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/device.md](api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/device.md)　`thing/product/{gateway_sn}/status`
  - 小节：设备拓扑更新
- **直播功能** → [api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/live.md](api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/live.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：设置直播镜头 / 设置直播清晰度 / 停止直播 / 开始直播
- **指令飞行** → [api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/drc.md](api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/drc.md)　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：请求授权结果通知 / flyto 执行结果事件通知 / 一键起飞结果事件通知 / DRC 链路状态通知（已废弃） / DRC-飞行控制无效原因通知 / 飞行控制—进入 POI 环绕模式 / 飞行控制—退出 POI 环绕模式 / 飞行控制—POI 环绕速度设置
- **远程控制** → [api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/remote-control.md](api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/remote-control.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：摄像头 osd 推送 / 飞行器状态信息上报 / 相机状态上报 / 拍照信息上报 / DRC-心跳 / DRC初始状态订阅 / DRC-飞行器急停 / DRC-杆量控制
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/rc-pro/properties.md](api-reference/pilot-to-cloud/mqtt/rc-pro/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备管理** → [api-reference/pilot-to-cloud/mqtt/rc-pro/device.md](api-reference/pilot-to-cloud/mqtt/rc-pro/device.md)　
  - 小节：设备拓扑更新
- **直播功能** → [api-reference/pilot-to-cloud/mqtt/rc-pro/live.md](api-reference/pilot-to-cloud/mqtt/rc-pro/live.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：设置直播镜头 / 设置直播清晰度 / 停止直播 / 开始直播
- **指令飞行** → [api-reference/pilot-to-cloud/mqtt/rc-pro/drc.md](api-reference/pilot-to-cloud/mqtt/rc-pro/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`
  - 小节：请求授权结果通知 / DRC 链路状态通知（已废弃） / 上报拍照进度 / 释放云端控制 / 请求授权云端控制 / 进入指令控制模式 / 退出指令飞行控制模式 / 负载控制—切换相机模式
- **远程控制** → [api-reference/pilot-to-cloud/mqtt/rc-pro/remote-control.md](api-reference/pilot-to-cloud/mqtt/rc-pro/remote-control.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：飞行器状态信息上报 / 摄像头osd 推送 / drc初始状态订阅
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/others/aircraft/properties.md](api-reference/pilot-to-cloud/mqtt/others/aircraft/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备属性** → [api-reference/pilot-to-cloud/mqtt/others/rc/properties.md](api-reference/pilot-to-cloud/mqtt/others/rc/properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **设备管理** → [api-reference/pilot-to-cloud/mqtt/others/rc/device.md](api-reference/pilot-to-cloud/mqtt/others/rc/device.md)　
  - 小节：设备拓扑更新
- **直播功能** → [api-reference/pilot-to-cloud/mqtt/others/rc/live.md](api-reference/pilot-to-cloud/mqtt/others/rc/live.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：设置直播镜头 / 设置直播清晰度 / 停止直播 / 开始直播
- **创建地图元素** → [api-reference/pilot-to-cloud/https/map-elements/create.md](api-reference/pilot-to-cloud/https/map-elements/create.md)　`POST /map/api/v1/workspaces/{workspace_id}/element-groups/{group_id}/elements`
  - 小节：创建元素
- **更新地图元素** → [api-reference/pilot-to-cloud/https/map-elements/update.md](api-reference/pilot-to-cloud/https/map-elements/update.md)　`PUT /map/api/v1/workspaces/{workspace_id}/elements/{id}`
  - 小节：更新元素
- **获取地图元素** → [api-reference/pilot-to-cloud/https/map-elements/obtain.md](api-reference/pilot-to-cloud/https/map-elements/obtain.md)　`GET /map/api/v1/workspaces/{workspace_id}/element-groups`
  - 小节：获取元素列表
- **删除地图元素** → [api-reference/pilot-to-cloud/https/map-elements/delete.md](api-reference/pilot-to-cloud/https/map-elements/delete.md)　`DELETE /map/api/v1/workspaces/{workspace_id}/elements/{id}`
  - 小节：删除元素
- **获取航线文件列表** → [api-reference/pilot-to-cloud/https/waypoint-management/obtain-waypointfile-list.md](api-reference/pilot-to-cloud/https/waypoint-management/obtain-waypointfile-list.md)　`GET /wayline/api/v1/workspaces/{workspace_id}/waylines`
  - 小节：获取航线列表
- **获取上传临时凭证** → [api-reference/pilot-to-cloud/https/waypoint-management/obtain-temporary-credential.md](api-reference/pilot-to-cloud/https/waypoint-management/obtain-temporary-credential.md)　`POST /storage/api/v1/workspaces/{workspace_id}/sts`
  - 小节：生成上传文件临时凭证
- **获取航线文件下载地址** → [api-reference/pilot-to-cloud/https/waypoint-management/get-waypointfile-download-location.md](api-reference/pilot-to-cloud/https/waypoint-management/get-waypointfile-download-location.md)　`GET /wayline/api/v1/workspaces/{workspace_id}/waylines/{id}/url`
  - 小节：获取航线文件下载地址
- **获取重复的航线文件名称** → [api-reference/pilot-to-cloud/https/waypoint-management/get-duplicated-waypointfile-name.md](api-reference/pilot-to-cloud/https/waypoint-management/get-duplicated-waypointfile-name.md)　`GET /wayline/api/v1/workspaces/`
  - 小节：获取重复的航线文件名称
- **航线文件上传结果上报** → [api-reference/pilot-to-cloud/https/waypoint-management/waypointfile-upload-result-report.md](api-reference/pilot-to-cloud/https/waypoint-management/waypointfile-upload-result-report.md)　`POST /wayline/api/v1/workspaces/{workspace_id}/upload-callback`
  - 小节：上报航线文件上传结果
- **批量收藏航线文件** → [api-reference/pilot-to-cloud/https/waypoint-management/collect-waypointfile-in-batch.md](api-reference/pilot-to-cloud/https/waypoint-management/collect-waypointfile-in-batch.md)　`POST /wayline/api/v1/workspaces/{workspace_id}/favorites`
  - 小节：批量收藏航线文件
- **批量取消收藏航线文件** → [api-reference/pilot-to-cloud/https/waypoint-management/cancel-collect.md](api-reference/pilot-to-cloud/https/waypoint-management/cancel-collect.md)　`DELETE /wayline/api/v1/workspaces/{workspace_id}/favorites`
  - 小节：批量取消收藏航线文件
- **文件快传** → [api-reference/pilot-to-cloud/https/media-management/fast-upload.md](api-reference/pilot-to-cloud/https/media-management/fast-upload.md)　`POST /media/api/v1/workspaces/{workspace_id}/fast-upload`
  - 小节：文件快传
- **获取已存在的文件精简指纹** → [api-reference/pilot-to-cloud/https/media-management/obtain-exited-tiny-fingerprint.md](api-reference/pilot-to-cloud/https/media-management/obtain-exited-tiny-fingerprint.md)　`POST /media/api/v1/workspaces/{workspace_id}/files/tiny-fingerprints`
  - 小节：获取已经存在的文件夹精简指纹
- **获取上传临时凭证** → [api-reference/pilot-to-cloud/https/media-management/obtain-temporary-credential.md](api-reference/pilot-to-cloud/https/media-management/obtain-temporary-credential.md)　`POST /storage/api/v1/workspaces/{workspace_id}/sts`
  - 小节：生成上传文件临时凭证
- **媒体文件上传结果上报** → [api-reference/pilot-to-cloud/https/media-management/mediafile-upload-result-report.md](api-reference/pilot-to-cloud/https/media-management/mediafile-upload-result-report.md)　`POST /media/api/v1/workspaces/{workspace_id}/upload-callback`
  - 小节：上报文件上传结果
- **文件组上传完成后回调** → [api-reference/pilot-to-cloud/https/media-management/group-upload-callback.md](api-reference/pilot-to-cloud/https/media-management/group-upload-callback.md)　`POST /media/api/v1/workspaces/{workspace_id}/group-upload-callback`
  - 小节：文件组上传完成后回调
- **获取设备拓扑** → [api-reference/pilot-to-cloud/https/situation-awareness/obtain-device-topology-list.md](api-reference/pilot-to-cloud/https/situation-awareness/obtain-device-topology-list.md)　`GET /manage/api/v1/workspaces/{workspace_id}/devices/topologies`
  - 小节：获取设备拓扑列表
- **消息发布** → [api-reference/pilot-to-cloud/websocket/map-elements/message-push.md](api-reference/pilot-to-cloud/websocket/map-elements/message-push.md)　
- **消息发布** → [api-reference/pilot-to-cloud/websocket/situation-awareness/message-push.md](api-reference/pilot-to-cloud/websocket/situation-awareness/message-push.md)　
  - 小节：Message deviceOsd / Message deviceOnline / Message deviceOffline / Message deviceUpdateTopo
- **JSBridge** → [api-reference/pilot-to-cloud/jsbridge.md](api-reference/pilot-to-cloud/jsbridge.md)　
  - 小节：概述 / 设备上云模块 / 直播模块 / API模块 / WS模块 / 地图元素模块 / TSA态势感知模块 / Media媒体模块

## API 参考 — 机场上云：飞行器物模型属性

- **M30/M30T 设备属性** → [api-reference/dock-to-cloud/mqtt/aircraft/m30-properties.md](api-reference/dock-to-cloud/mqtt/aircraft/m30-properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **M3D/M3TD 设备属性** → [api-reference/dock-to-cloud/mqtt/aircraft/m3d-properties.md](api-reference/dock-to-cloud/mqtt/aircraft/m3d-properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表
- **M4D/M4TD 设备属性** → [api-reference/dock-to-cloud/mqtt/aircraft/m4d-properties.md](api-reference/dock-to-cloud/mqtt/aircraft/m4d-properties.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state）`　`thing/product/{gateway_sn}/property/set`
  - 小节：设备属性列表

## API 参考 — 机场上云：Dock1（DJI 机场） MQTT 模块

- **设备属性** → [api-reference/dock-to-cloud/mqtt/dock/dock1/properties.md](api-reference/dock-to-cloud/mqtt/dock/dock1/properties.md)　`thing/product/{aircraft_sn}/osd**`　`thing/product/{aircraft_sn}/state**`　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`
  - 小节：设备属性列表 / 设备属性推送 / 设备属性设置
- **设备管理** → [api-reference/dock-to-cloud/mqtt/dock/dock1/device.md](api-reference/dock-to-cloud/mqtt/dock/dock1/device.md)　
  - 小节：设备拓扑更新
- **组织管理** → [api-reference/dock-to-cloud/mqtt/dock/dock1/organization.md](api-reference/dock-to-cloud/mqtt/dock/dock1/organization.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：获取设备绑定信息 / 查询设备绑定对应的组织信息 / 设备绑定到组织
- **直播功能** → [api-reference/dock-to-cloud/mqtt/dock/dock1/live.md](api-reference/dock-to-cloud/mqtt/dock/dock1/live.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：开始直播 / 停止直播 / 设置直播清晰度 / 设置直播镜头
- **媒体管理** → [api-reference/dock-to-cloud/mqtt/dock/dock1/file.md](api-reference/dock-to-cloud/mqtt/dock/dock1/file.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：媒体文件上传优先级上报 / 媒体文件上传结果上报 / 调整上传的文件为最高优先级 / 获取上传临时凭证
- **航线管理** → [api-reference/dock-to-cloud/mqtt/dock/dock1/wayline.md](api-reference/dock-to-cloud/mqtt/dock/dock1/wayline.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：机场任务准备异常通知 / 设备返航退出状态通知 / 上报航线任务进度 / 任务就绪通知 / 返航信息 / 取消准备中的任务 / 创建航线任务（废弃） / 下发任务
- **HMS 管理** → [api-reference/dock-to-cloud/mqtt/dock/dock1/hms.md](api-reference/dock-to-cloud/mqtt/dock/dock1/hms.md)　`thing/product/{gateway_sn}/events`
  - 小节：健康告警
- **远程调试** → [api-reference/dock-to-cloud/mqtt/dock/dock1/cmd.md](api-reference/dock-to-cloud/mqtt/dock/dock1/cmd.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：强制关舱盖进度 / 飞行器开机进度 / 飞行器关机进度 / 机场重启进度 / 关闭舱盖进度 / 打开舱盖进度 / 打开充电进度 / 关闭充电进度
- **固件升级** → [api-reference/dock-to-cloud/mqtt/dock/dock1/firmware.md](api-reference/dock-to-cloud/mqtt/dock/dock1/firmware.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：固件升级进度 / 固件升级
- **远程日志** → [api-reference/dock-to-cloud/mqtt/dock/dock1/log.md](api-reference/dock-to-cloud/mqtt/dock/dock1/log.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：文件上传进度通知 / 获取设备可上传的文件列表 / 发起日志文件上传 / 上传状态更新
- **配置更新** → [api-reference/dock-to-cloud/mqtt/dock/dock1/config.md](api-reference/dock-to-cloud/mqtt/dock/dock1/config.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：获取配置
- **指令飞行** → [api-reference/dock-to-cloud/mqtt/dock/dock1/drc.md](api-reference/dock-to-cloud/mqtt/dock/dock1/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`
  - 小节：flyto 执行结果事件通知 / 一键起飞结果事件通知 / DRC 链路状态通知（已废弃） / DRC-飞行控制无效原因通知 / 飞行控制—POI 环绕状态信息通知 / 上报拍照进度 / 飞行控制权抢夺 / 负载控制权抢夺
- **AirSense** → [api-reference/dock-to-cloud/mqtt/dock/dock1/airsense.md](api-reference/dock-to-cloud/mqtt/dock/dock1/airsense.md)　`thing/product/{gateway_sn}/events`
  - 小节：Airsense 告警通知
- **自定义飞行区** → [api-reference/dock-to-cloud/mqtt/dock/dock1/custom-flight-area.md](api-reference/dock-to-cloud/mqtt/dock/dock1/custom-flight-area.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：自定义飞行区文件同步状态 / 自定义飞行区告警信息推送 / 自定义飞行区更新指令 / 自定义飞行区文件获取
- **PSDK 功能** → [api-reference/dock-to-cloud/mqtt/dock/dock1/psdk.md](api-reference/dock-to-cloud/mqtt/dock/dock1/psdk.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：psdk-ui资源包上传结果上报 / psdk-浮窗文本推送 / 喊话器-音频播放进度通知 / 喊话器-tts播放进度通知 / psdk-设置控件值 / psdk-发送文本框内容 / 喊话器-开始播放音频 / 喊话器-开始播放TTS文本
- **PSDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock1/psdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock1/psdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送 Cloud / Cloud - 自定义消息推送到 PSDK
- **ESDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock1/esdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock1/esdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送cloud / cloud-自定义消息推送到esdk
- **远程解禁** → [api-reference/dock-to-cloud/mqtt/dock/dock1/flysafe.md](api-reference/dock-to-cloud/mqtt/dock/dock1/flysafe.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：启用/禁用设备的单个解禁证书 / 更新设备的解禁证书 / 获取设备的解禁证书列表

## API 参考 — 机场上云：Dock2（DJI 机场 2） MQTT 模块

- **设备属性** → [api-reference/dock-to-cloud/mqtt/dock/dock2/properties.md](api-reference/dock-to-cloud/mqtt/dock/dock2/properties.md)　`thing/product/{aircraft_sn}/osd**`　`thing/product/{aircraft_sn}/state**`　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`
  - 小节：设备属性列表 / 设备属性推送 / 设备属性设置
- **设备管理** → [api-reference/dock-to-cloud/mqtt/dock/dock2/device.md](api-reference/dock-to-cloud/mqtt/dock/dock2/device.md)　
  - 小节：设备拓扑更新
- **组织管理** → [api-reference/dock-to-cloud/mqtt/dock/dock2/organization.md](api-reference/dock-to-cloud/mqtt/dock/dock2/organization.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：获取设备绑定信息 / 查询设备绑定对应的组织信息 / 设备绑定到组织
- **直播功能** → [api-reference/dock-to-cloud/mqtt/dock/dock2/live.md](api-reference/dock-to-cloud/mqtt/dock/dock2/live.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：直播相机切换 / 开始直播 / 停止直播 / 设置直播清晰度 / 设置直播镜头
- **媒体管理** → [api-reference/dock-to-cloud/mqtt/dock/dock2/file.md](api-reference/dock-to-cloud/mqtt/dock/dock2/file.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：媒体文件上传优先级上报 / 媒体文件上传结果上报 / 调整上传的文件为最高优先级 / 获取上传临时凭证
- **航线管理** → [api-reference/dock-to-cloud/mqtt/dock/dock2/wayline.md](api-reference/dock-to-cloud/mqtt/dock/dock2/wayline.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：返航信息 / 任务就绪通知 / 上报航线任务进度 / 设备返航退出状态通知 / 空中下发航线状态上报 / 执行任务 / 指定home点的返航 / 任务终止
- **HMS 管理** → [api-reference/dock-to-cloud/mqtt/dock/dock2/hms.md](api-reference/dock-to-cloud/mqtt/dock/dock2/hms.md)　`thing/product/{gateway_sn}/events`
  - 小节：健康告警
- **远程调试** → [api-reference/dock-to-cloud/mqtt/dock/dock2/cmd.md](api-reference/dock-to-cloud/mqtt/dock/dock2/cmd.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/events_reply`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：强制关舱盖进度 / 飞行器关机进度 / 机场重启进度 / 关闭舱盖进度 / 打开舱盖进度 / 打开充电进度 / 关闭充电进度 / 飞行器数据格式化进度
- **固件升级** → [api-reference/dock-to-cloud/mqtt/dock/dock2/firmware.md](api-reference/dock-to-cloud/mqtt/dock/dock2/firmware.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：固件升级进度 / 固件升级
- **远程日志** → [api-reference/dock-to-cloud/mqtt/dock/dock2/log.md](api-reference/dock-to-cloud/mqtt/dock/dock2/log.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：文件上传进度通知 / 获取设备可上传的文件列表 / 发起日志文件上传 / 上传状态更新
- **配置更新** → [api-reference/dock-to-cloud/mqtt/dock/dock2/config.md](api-reference/dock-to-cloud/mqtt/dock/dock2/config.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：获取配置
- **指令飞行** → [api-reference/dock-to-cloud/mqtt/dock/dock2/drc.md](api-reference/dock-to-cloud/mqtt/dock/dock2/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`
  - 小节：flyto 执行结果事件通知 / 一键起飞结果事件通知 / DRC 链路状态通知（已废弃） / DRC-飞行控制无效原因通知 / 上报拍照进度 / 飞行控制权抢夺 / 负载控制权抢夺 / 进入指令飞行控制模式
- **AirSense** → [api-reference/dock-to-cloud/mqtt/dock/dock2/airsense.md](api-reference/dock-to-cloud/mqtt/dock/dock2/airsense.md)　`thing/product/{gateway_sn}/events`
  - 小节：Airsense 告警通知
- **自定义飞行区** → [api-reference/dock-to-cloud/mqtt/dock/dock2/custom-flight-area.md](api-reference/dock-to-cloud/mqtt/dock/dock2/custom-flight-area.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：自定义飞行区文件同步状态 / 自定义飞行区告警信息推送 / 自定义飞行区更新指令 / 自定义飞行区文件获取
- **PSDK 功能** → [api-reference/dock-to-cloud/mqtt/dock/dock2/psdk.md](api-reference/dock-to-cloud/mqtt/dock/dock2/psdk.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：psdk-ui资源包上传结果上报 / psdk-浮窗文本推送 / 喊话器-音频播放进度通知 / 喊话器-tts播放进度通知 / psdk-设置控件值 / psdk-发送文本框内容 / 喊话器-开始播放音频 / 喊话器-开始播放TTS文本
- **PSDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock2/psdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock2/psdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送 Cloud / Cloud - 自定义消息推送到 PSDK
- **ESDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock2/esdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock2/esdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送cloud / cloud-自定义消息推送到esdk
- **远程解禁** → [api-reference/dock-to-cloud/mqtt/dock/dock2/flysafe.md](api-reference/dock-to-cloud/mqtt/dock/dock2/flysafe.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：启用/禁用设备的单个解禁证书 / 更新设备的解禁证书 / 获取设备的解禁证书列表
- **远程控制** → [api-reference/dock-to-cloud/mqtt/dock/dock2/remote-control.md](api-reference/dock-to-cloud/mqtt/dock/dock2/remote-control.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/services_reply`
  - 小节：拍照信息上报 / 相机状态上报 / 飞行器状态信息上报 / 摄像头 osd 推送 / 负载控制—切换相机模式 / 强制降落 / 急停 / 紧急降落

## API 参考 — 机场上云：Dock3（DJI 机场 3） MQTT 模块

- **设备属性** → [api-reference/dock-to-cloud/mqtt/dock/dock3/properties.md](api-reference/dock-to-cloud/mqtt/dock/dock3/properties.md)　`thing/product/{aircraft_sn}/osd**`　`thing/product/{aircraft_sn}/state**`　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`
  - 小节：设备属性列表 / 设备属性推送 / 设备属性设置
- **设备管理** → [api-reference/dock-to-cloud/mqtt/dock/dock3/device.md](api-reference/dock-to-cloud/mqtt/dock/dock3/device.md)　
  - 小节：设备拓扑更新
- **组织管理** → [api-reference/dock-to-cloud/mqtt/dock/dock3/organization.md](api-reference/dock-to-cloud/mqtt/dock/dock3/organization.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：设备绑定到组织 / 查询设备绑定对应的组织信息 / 获取设备绑定信息
- **直播功能** → [api-reference/dock-to-cloud/mqtt/dock/dock3/live.md](api-reference/dock-to-cloud/mqtt/dock/dock3/live.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：直播相机切换 / 设置直播镜头 / 设置直播清晰度 / 停止直播 / 开始直播
- **航线管理** → [api-reference/dock-to-cloud/mqtt/dock/dock3/wayline.md](api-reference/dock-to-cloud/mqtt/dock/dock3/wayline.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：返航信息 / 任务就绪通知 / 上报航线任务进度 / 设备返航退出状态通知 / 空中下发航线状态上报 / 执行任务 / 指定home点的返航 / 任务终止
- **HMS 管理** → [api-reference/dock-to-cloud/mqtt/dock/dock3/hms.md](api-reference/dock-to-cloud/mqtt/dock/dock3/hms.md)　`thing/product/{gateway_sn}/events`
  - 小节：健康告警
- **远程调试** → [api-reference/dock-to-cloud/mqtt/dock/dock3/cmd.md](api-reference/dock-to-cloud/mqtt/dock/dock3/cmd.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：eSIM 的运营商切换进度 / eSIM 激活进度 / 机场数据格式化进度 / 飞行器数据格式化进度 / 关闭充电进度 / 打开充电进度 / 打开舱盖进度 / 关闭舱盖进度
- **固件升级** → [api-reference/dock-to-cloud/mqtt/dock/dock3/firmware.md](api-reference/dock-to-cloud/mqtt/dock/dock3/firmware.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：固件升级进度 / 固件升级
- **远程日志** → [api-reference/dock-to-cloud/mqtt/dock/dock3/log.md](api-reference/dock-to-cloud/mqtt/dock/dock3/log.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：文件上传进度通知 / 上传状态更新 / 发起日志文件上传 / 获取设备可上传的文件列表
- **配置更新** → [api-reference/dock-to-cloud/mqtt/dock/dock3/config.md](api-reference/dock-to-cloud/mqtt/dock/dock3/config.md)　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`
  - 小节：获取配置
- **指令飞行** → [api-reference/dock-to-cloud/mqtt/dock/dock3/drc.md](api-reference/dock-to-cloud/mqtt/dock/dock3/drc.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`
  - 小节：避障记录上报事件通知 / flyto 执行结果事件通知 / 一键起飞结果事件通知 / DRC 链路状态通知（已废弃） / DRC-飞行控制无效原因通知 / 上报拍照进度 / 飞行控制权抢夺 / 负载控制权抢夺
- **AirSense** → [api-reference/dock-to-cloud/mqtt/dock/dock3/airsense.md](api-reference/dock-to-cloud/mqtt/dock/dock3/airsense.md)　`thing/product/{gateway_sn}/events`
  - 小节：Airsense 告警通知
- **自定义飞行区** → [api-reference/dock-to-cloud/mqtt/dock/dock3/custom-fly-region.md](api-reference/dock-to-cloud/mqtt/dock/dock3/custom-fly-region.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：自定义飞行区告警信息推送 / 自定义飞行区文件同步状态 / 自定义飞行区更新指令 / 自定义飞行区文件获取
- **PSDK 功能** → [api-reference/dock-to-cloud/mqtt/dock/dock3/psdk.md](api-reference/dock-to-cloud/mqtt/dock/dock3/psdk.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：喊话器-tts播放进度通知 / 喊话器-音频播放进度通知 / psdk-浮窗文本推送 / psdk-ui资源包上传结果上报 / 喊话器-设置音量 / 喊话器-设置播放模式 / 喊话器-停止播放 / 喊话器-重新播放
- **PSDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock3/psdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock3/psdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送cloud / cloud-自定义消息推送到psdk
- **ESDK 互联互通** → [api-reference/dock-to-cloud/mqtt/dock/dock3/esdk-transmit-custom-data.md](api-reference/dock-to-cloud/mqtt/dock/dock3/esdk-transmit-custom-data.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：自定义消息推送cloud / cloud-自定义消息推送到esdk
- **远程解禁** → [api-reference/dock-to-cloud/mqtt/dock/dock3/flysafe.md](api-reference/dock-to-cloud/mqtt/dock/dock3/flysafe.md)　`thing/product/{gateway_sn}/services`　`thing/product/{gateway_sn}/services_reply`
  - 小节：启用/禁用设备的单个解禁证书 / 更新设备的解禁证书 / 获取设备的解禁证书列表
- **远程控制** → [api-reference/dock-to-cloud/mqtt/dock/dock3/remote-control.md](api-reference/dock-to-cloud/mqtt/dock/dock3/remote-control.md)　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：PSDK—浮窗推送 / 喊话器—音频播放进度 / PSDK—状态上报 / PSDK—UI资源包上传 / 飞行器状态信息上报 / 相机状态上报 / 摄像头osd 推送 / AI状态上报
- **媒体管理** → [api-reference/dock-to-cloud/mqtt/dock/dock3/media.md](api-reference/dock-to-cloud/mqtt/dock/dock3/media.md)　`thing/product/{gateway_sn}/events`　`thing/product/{gateway_sn}/requests`　`thing/product/{gateway_sn}/requests_reply`　`thing/product/{gateway_sn}/services`
  - 小节：媒体文件上传优先级上报 / 媒体文件上传结果上报 / 调整上传的文件为最高优先级 / 获取上传临时凭证

## API 参考 — 机场上云 MQTT 通用

- **Topic 定义** → [api-reference/dock-to-cloud/mqtt/topic-definition.md](api-reference/dock-to-cloud/mqtt/topic-definition.md)　`thing/product/{device_sn}/osd`　`thing/product/{device_sn}/state`　`thing/product/{gateway_sn}/drc/down`　`thing/product/{gateway_sn}/drc/up`
  - 小节：Topic 总览 / 公共字段解释 / osd 结构示例 / state 结构示例 / services 结构示例 / services_reply 结构示例 / events 结构示例 / events_reply 结构示例

## 调试工具

- **Pilot Webview 调试** → [debug/dji-pilot2-webview-debug.md](debug/dji-pilot2-webview-debug.md)　
  - 小节：电脑端基于Chrome Devtools调试 / 基于vconsole插件调试
- **Pilot 日志导出** → [debug/log-export.md](debug/log-export.md)　
  - 小节：概述 / 飞机日志导出 / 遥控器日志导出 / DJI Pilot 2 日志导出 / 录屏、截屏
- **MQTT 调试工具** → [debug/mqttx.md](debug/mqttx.md)　

## 其他

- **安全飞行须知** → [flight-safety-notification.md](flight-safety-notification.md)　
  - 小节：关键功能开发 / 固件升级
- **文档阅读指引** → [tutorial-map.md](tutorial-map.md)　
  - 小节：阅读公告 / 文档阅读地图 / API 总览 / 功能集合
- **错误码** → [error-code.md](error-code.md)　
  - 小节：错误码说明 / 错误码与描述
- **FAQ** → [faq.md](faq.md)　`thing/product/{gateway_sn}/requests_reply`
  - 小节：如何在航线飞行任务中使用大疆机场 2 和大疆机场 3 的定向拍照？ / 机场执行蛙跳任务时，B 控遥控器会自己断开吗？ / 为什么第三方平台使用机场执行一键起飞或航线任务时，出现等待时间过长的问题？
- **版本发布记录** → [release-notes.md](release-notes.md)　
  - 小节：关于DJI Cloud API Demo 终止维护公告 / 上云 API v1.16.1 发布记录 / 上云 API v1.16 发布记录 / 上云 API v1.15 发布记录 / 上云 API v1.14 发布记录 / 上云 API v1.13.0 发布记录 / 上云 API v1.12.0 发布记录 / 上云 API v1.11.3 发布记录
