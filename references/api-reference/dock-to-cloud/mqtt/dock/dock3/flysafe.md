---
title: "远程解禁"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock3/flysafe.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Service

## 启用/禁用设备的单个解禁证书

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** unlock_license_switch

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| license_id | 解禁证书唯一标识 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| enable | 是否启用 | bool | {"0":"未启用","1":"已启用"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"enable": true,
		"license_id": 240330
	},
	"method": "unlock_license_switch",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** unlock_license_switch

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |
| license_id | 解禁证书唯一标识 | int | {"max":"","min":"","step":"","unit_name":null} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"license_id": 240330,
		"result": 0
	},
	"method": "unlock_license_switch",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123
}
```

## 更新设备的解禁证书

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** unlock_license_update

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| file | 离线证书文件 | struct |  | 可缺省，按照 Flysafe 服务器最新证书进行更新 |
| »url | 文件 URL | text |  |  |
| »fingerprint | 文件签名 | text |  | 文件 MD5 签名 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"file": {
			"fingerprint": "xxxx",
			"url": "https://xx.oss-cn-hangzhou.aliyuncs.com/xx.kmz?Expires=xx&OSSAccessKeyId=xxx&Signature=xxx"
		}
	},
	"method": "unlock_license_update",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** unlock_license_update

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"method": "unlock_license_update",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123
}
```

## 获取设备的解禁证书列表

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** unlock_license_list

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| device_model_domain | 指定证书拉取位置 | enum_int | {"0":"飞行器","3":"机场"} | 从飞行器拉取的是成功导入飞行器的解禁证书；从机场拉取的是Flysafe官网申请通过的解禁证书。 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"device_model_domain": 0
	},
	"method": "unlock_license_list",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** unlock_license_list

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |
| device_model_domain | 指定证书拉取位置 | enum_int | {"0":"飞行器","3":"机场"} | 从飞行器拉取的是成功导入飞行器的解禁证书；从机场拉取的是Flysafe官网申请通过的解禁证书。 |
| consistence | 证书一致性 | bool | {"0":"不一致","1":"一致"} | 当前飞行器已导入的证书和服务器已申请通过的证书是否一致 |
| licenses | 证书列表 | array | {"size": -, "item_type": struct} |  |
| »common_fields | 通用信息 | struct |  |  |
| »»license_id | 解禁证书唯一标识 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»name | 解禁证书名称 | text | {"length":""} |  |
| »»type | 解禁证书类型 | enum_int | {"0":"授权区解禁","1":"自定义圆形区域解禁","2":"国家/地区解禁","3":"限高解禁","4":"自定义多边形区域解禁","5":"功率解禁","6":"RID 解禁"} |  |
| »»group_id | 证书所在分组的唯一标识 | int | {"max":"","min":"","step":"","unit_name":null} | 一个用户账号为一台设备申请的所有证书同属于一组 |
| »»user_id | 证书归属用户的账号 | text | {"length":""} | Flysafe 官网申请解禁证书要求提供大疆账号或机场 SN, 机场也被认为是用户的一种, Flysafe官网为机场分配了唯一 ID |
| »»device_sn | 证书绑定的设备序列号（SN） | text | {"length":""} |  |
| »»begin_time | 有效期起始时间戳 | int | {"max":"","min":"","step":"","unit_name":null} | 秒级UNIX时间戳 |
| »»end_time | 有效期终止时间戳 | int | {"max":"","min":"","step":"","unit_name":null} | 秒级UNIX时间戳 |
| »»user_only | 是否需要校验用户账号 | bool | {"0":"不需要","1":"需要"} |  |
| »»enabled | 是否启用 | bool | {"0":"未启用","1":"已启用"} |  |
| »area_unlock | 授权区解禁证书信息 | struct |  |  |
| »»area_ids | 区域编号集合 | array | {"size": -, "item_type": enum_int} |  |
| »circle_unlock | 自定义圆形区域解禁证书信息 | struct |  |  |
| »»radius | 区域半径 | int | {"unit":"米 / m"} |  |
| »»latitude | 圆心纬度 | double | {"max":90,"min":-90} | 角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »»longitude | 圆心经度 | double | {"max":180,"min":-180} | 角度值，东经是正，西经是负，精度到小数点后6位 |
| »»height | 限高 | int | {"max":65535,"min":0,"unit":"米 / m"} |  |
| »country_unlock | 国家/地区解禁证书信息 | struct |  |  |
| »»country_number | 国家/地区数字代码 | enum_int | {} | 详见ISO_3166-1国际标准(https://en.wikipedia.org/wiki/ISO_3166-1) |
| »»height | 限高 | int | {"max":65535,"min":0,"unit":"米 / m"} |  |
| »height_unlock | 限高解禁证书信息 | struct |  |  |
| »»height | 限高 | int | {"max":65535,"min":0,"unit":"米 / m"} |  |
| »polygon_unlock | 自定义多边形区域解禁证书信息 | struct |  |  |
| »»points | 多边形顶点GPS坐标集合 | array | {"size": -, "item_type": struct} |  |
| »»»latitude | 纬度 | double | {"max":90,"min":-90} | 角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »»»longitude | 经度 | double | {"max":180,"min":-180} | 角度值，东经是正，西经是负，精度到小数点后6位 |
| »power_unlock | 功率解禁证书信息 | struct |  |  |
| »rid_unlock | RID解禁证书信息 | struct |  |  |
| »»level | RID类型 | enum_int | {"1":"欧盟 RID 解禁","2":"中国 RID 解禁"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"consistence": false,
		"device_model_domain": 0,
		"licenses": [
			{
				"area_unlock": {
					"area_ids": [
						115001769,
						8724
					]
				},
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": true,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240330,
					"name": "XXX区域解禁",
					"type": 0,
					"user_id": "xxxxxxxxx",
					"user_only": false
				}
			},
			{
				"circle_unlock": {
					"height": 500,
					"latitude": 22.60309,
					"longitude": 113.947815,
					"radius": 1581
				},
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240331,
					"name": "XXX圆形解禁",
					"type": 1,
					"user_id": "xxxxxxxxx",
					"user_only": false
				}
			},
			{
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240332,
					"name": "中国国家解禁",
					"type": 2,
					"user_id": "xxxxxxxxx",
					"user_only": false
				},
				"country_unlock": {
					"country_number": 156,
					"height": 500
				}
			},
			{
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240333,
					"name": "XXX高度解禁",
					"type": 3,
					"user_id": "xxxxxxxxx",
					"user_only": false
				},
				"height_unlock": {
					"height": 500
				}
			},
			{
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240334,
					"name": "XXX多边形解禁",
					"type": 4,
					"user_id": "xxxxxxxxx",
					"user_only": false
				},
				"polygon_unlock": {
					"points": [
						{
							"latitude": 22.55403932,
							"longitude": 113.90488828
						},
						{
							"latitude": 22.55520018,
							"longitude": 113.92180215
						},
						{
							"latitude": 22.54656858,
							"longitude": 113.92051272
						}
					]
				}
			},
			{
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240335,
					"name": "XXX功率解禁",
					"type": 5,
					"user_id": "xxxxxxxxx",
					"user_only": false
				},
				"power_unlock": {}
			},
			{
				"common_fields": {
					"begin_time": 1696948115,
					"device_sn": "xxxxxxxxx",
					"enabled": false,
					"end_time": 2145916800,
					"group_id": 2896,
					"license_id": 240336,
					"name": "XXXRID解禁",
					"type": 6,
					"user_id": "xxxxxxxxx",
					"user_only": false
				},
				"rid_unlock": {
					"level": 1
				}
			}
		],
		"result": 0
	},
	"gateway": "",
	"method": "unlock_license_list",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655
}
```
