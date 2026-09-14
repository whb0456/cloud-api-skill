---
title: "配置更新"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock1/config.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Requests

## 获取配置

**Topic:** thing/product/{gateway_sn}/requests

**Direction:** up

**Method:** config

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| config_type | 配置类型 | enum_string | {"json":"json 格式"} |  |
| config_scope | 配置范围 | enum_string | {"product":"产品维度"} |  |

**Example:**

```
{
	"bid": "42a19f36-5117-4520-bd13-fd61d818d52e",
	"data": {
		"config_scope": "product",
		"config_type": "json"
	},
	"gateway": "sn",
	"tid": "6a7bfe89-c386-4043-b600-b518e10096cc",
	"timestamp": 1667803298000,
	"method": "config"
}
```

**Topic:** thing/product/{gateway_sn}/requests_reply

**Direction:** down

**Method:** config

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| ntp_server_host | NTP 服务 Host | text |  |  |
| app_id | 在 [开发者网站](https://developer.dji.com/user/apps/#all) 创建的 App 的 ID | text |  |  |
| app_key | 在 [开发者网站](https://developer.dji.com/user/apps/#all) 创建的 App 的 Key | text |  |  |
| app_license | 在 [开发者网站](https://developer.dji.com/user/apps/#all) 创建的 App 的 License | text |  |  |
| ntp_server_port | NTP 服务端口号 | int |  | 若请求中没有本字段，NTP 默认端口号为 123 |

**Example:**

```
{
	"bid": "42a19f36-5117-4520-bd13-fd61d818d52e",
	"data": {
		"app_id": "123456",
		"app_key": "app_key",
		"app_license": "app_license",
		"ntp_server_host": "host_url",
		"ntp_server_port": 456
	},
	"gateway": "sn",
	"tid": "6a7bfe89-c386-4043-b600-b518e10096cc",
	"timestamp": 1667803298000,
	"method": "config"
}
```
