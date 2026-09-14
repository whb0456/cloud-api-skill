---
title: "PSDK 互联互通"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock3/psdk-transmit-custom-data.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 自定义消息推送cloud

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** custom_data_transmission_from_psdk

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| value | 数据内容 | text | {"length":"小于 256"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"data": {
		"value": "hello world"
	},
	"gateway": "4TADKAQ000002J",
	"method": "custom_data_transmission_from_psdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689911315621
}
```

# Service

## cloud-自定义消息推送到psdk

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** custom_data_transmission_to_psdk

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| value | 数据内容 | text | {"length":"小于 256"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"data": {
		"value": "hello world"
	},
	"method": "custom_data_transmission_to_psdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689740550047
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** custom_data_transmission_to_psdk

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"data": {
		"result": 0
	},
	"method": "custom_data_transmission_to_psdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689740550047
}
```
