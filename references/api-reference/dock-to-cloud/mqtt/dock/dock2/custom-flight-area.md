---
title: "自定义飞行区"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock2/custom-flight-area.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

1. 自定义飞行区文件名需满足以下要求：geofence_{fileMD5}.json。其中 fileMD5 为文件 MD5 值的占位。
2. 点击下载自定义飞行区模板文件：[自定义飞行区文件协议模板](https://terra-1-g.djicdn.com/fee90c2e03e04e8da67ea6f56365fc76/SDK%20%E6%96%87%E6%A1%A3/CloudAPI/custom-flight-area-file-template.json)

# Event

## 自定义飞行区文件同步状态

自定义飞行区文件从云端同步到设备端的进展，用于后续圈定飞行器的飞行区域

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** flight_areas_sync_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| status | 同步状态 | enum_string | {"fail":"失败","switch_fail":"使能开关失败","synchronized":"已同步","synchronizing":"同步中","wait_sync":"待同步"} |  |
| reason | 返回码 | int | {"1":"解析云端返回的文件信息失败","2":"获取飞行器端文件信息失败","3":"从云端下载文件失败","4":"链路翻转失败","5":"传输文件失败","6":"disable失败","7":"自定义飞行区删除失败","8":"飞行器端加载作业区域数据失败","9":"enable失败","10":"机场增强图传无法关闭，作业区域数据同步失败","11":"飞行器开机失败，无法同步作业区域数据","12":"checksum校验失败","13":"同步异常超时"} |  |
| file | 自定义飞行区文件 | struct |  |  |
| »name | 自定义飞行区文件名称 | text |  |  |
| »checksum | 文件签名摘要 | text | {} | 文件 SHA256 签名 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"file": {
			"checksum": "sha256",
			"name": "geofence_xxx.json"
		},
		"reason": 0,
		"status": "synchronized"
	},
	"method": "flight_areas_sync_progress",
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556
}
```

## 自定义飞行区告警信息推送

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** flight_areas_drone_location

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| drone_locations | 飞行器自定义飞行区距离信息 | struct |  |  |
| »area_id | 区域唯一 ID | string |  |  |
| »area_distance | 距离飞行边界距离 | float |  |  |
| »is_in_area | 是否在自定义飞行区内 | bool |  |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"drone_locations": [
			{
				"area_distance": 100.11,
				"area_id": "d275c4e1-d864-4736-8b5d-5f5882ee9bdd",
				"is_in_area": true
			}
		]
	},
	"method": "flight_areas_drone_location",
	"need_reply": 0,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556
}
```

# Service

## 自定义飞行区更新指令

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flight_areas_update

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": null,
	"method": "flight_areas_update",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flight_areas_update

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"method": "flight_areas_update",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

# Requests

## 自定义飞行区文件获取

**Topic:** thing/product/{gateway_sn}/requests

**Direction:** up

**Method:** flight_areas_get

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": null,
	"method": "flight_areas_get",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

**Topic:** thing/product/{gateway_sn}/requests_reply

**Direction:** down

**Method:** flight_areas_get

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »files | 自定义飞行区文件列表 | array | {"size": -, "item_type": struct} | 没有自定义飞行区则为空数组 |
| »»name | 文件名 | text | {} |  |
| »»url | 文件 URL | text | {} |  |
| »»checksum | 文件签名摘要 | text | {} | 文件 SHA256 签名 |
| »»size | 文件大小 | int | {} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"files": [
				{
					"checksum": "sha256",
					"name": "geofence_xxx.json",
					"size": 500,
					"url": "https://xx.oss-cn-hangzhou.aliyuncs.com/xx.json?Expires=xx&OSSAccessKeyId=xxx&Signature=xxx"
				}
			]
		},
		"result": 0
	},
	"method": "flight_areas_get",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```
