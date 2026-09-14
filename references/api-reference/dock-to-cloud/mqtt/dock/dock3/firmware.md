---
title: "固件升级"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock3/firmware.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 固件升级进度

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** ota_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »status | 任务状态 | enum_string | {"canceled":"取消或终止","failed":"失败","in_progress":"执行中","ok":"执行成功","paused":"暂停","rejected":"拒绝","sent":"已下发","timeout":"超时"} |  |
| »progress | 进度 | struct |  |  |
| »»percent | 进度百分比 | int | {"max":"100","min":"0","step":"1","unit_name":"百分比 / %"} |  |
| »»current_step | 当前步骤 | enum_string | {"download_firmware":"下载固件","upgrade_firmware":"更新固件"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"progress": {
				"percent": 10,
				"current_step": "download_firmware"
			},
			"status": "in_progress"
		},
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ota_progress"
}
```

# Service

## 固件升级

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** ota_create

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| devices | 固件升级设备集合 | array | {"size": 2, "item_type": struct} |  |
| »sn | 设备序列号（SN） | text | {"length":"10240"} |  |
| »product_version | 固件版本 | text | {"length":"10240"} |  |
| »file_url | 固件文件下载地址 | text | {"length":"10240"} |  |
| »md5 | 固件文件 MD5 | text | {"length":"10240"} |  |
| »file_size | 固件文件大小 | int |  |  |
| »file_name | 固件文件名称 | text |  |  |
| »firmware_upgrade_type | 固件升级类型 | enum_int | {"2":"一致性升级","3":"普通升级","4":"PSDK升级"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"devices": [
			{
				"file_name": "wm245_1.00.223.zip",
				"file_size": 653467234,
				"file_url": "https://s3.com/xxx.zip",
				"firmware_upgrade_type": 2,
				"md5": "abcdefabcdefabcdef",
				"product_version": "1.00.223",
				"sn": "drone_sn"
			},
			{
				"firmware_upgrade_type": 3,
				"product_version": "1.00.223",
				"sn": "dock_sn"
			}
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ota_create"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** ota_create

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »status | 任务状态 | enum_string | {"canceled":"取消或终止","failed":"失败","in_progress":"执行中","ok":"执行成功","paused":"暂停","rejected":"拒绝","sent":"已下发","timeout":"超时"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"status": "in_progress"
		},
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ota_create"
}
```
