---
title: "ESDK 互联互通"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock1/esdk-transmit-custom-data.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 自定义消息推送cloud

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** custom_data_transmission_from_esdk

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
	"method": "custom_data_transmission_from_esdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689911315621
}
```

# Service

## cloud-自定义消息推送到esdk

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** custom_data_transmission_to_esdk

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
	"method": "custom_data_transmission_to_esdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689740550047
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** custom_data_transmission_to_esdk

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"data": {
		"result": 0
	},
	"method": "custom_data_transmission_to_esdk",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
	"timestamp": 1689740550047
}
```
