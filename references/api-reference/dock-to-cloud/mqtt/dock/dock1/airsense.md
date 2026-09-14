---
title: "AirSense"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock1/airsense.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## Airsense 告警通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** airsense_warning

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| icao | ICAO 飞机地址 | text |  | ICAO 民用航空飞机地址 |
| warning_level | 告警等级 | enum_int | {"0":"无危险","1":"等级一","2":"等级二","3":"等级三","4":"等级四"} | 危险等级越高越危险，等级大于等于3建议无人机避让 |
| latitude | 纬度 | float | {"max":90,"min":-90} | 飞机所在位置点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| longitude | 经度 | float | {"max":180,"min":-180} | 飞机所在位置点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| altitude | 绝对高度 | int |  | 航班绝对高度，单位是米 |
| altitude_type | 绝对高度类型 | enum_int | {"0":"椭球高","1":"海拔高"} |  |
| heading | 航向 | float |  | 航向角度，角度值，0为正北方向，90为正东方向，精度到小数点后1位 |
| relative_altitude | 航班相对无人机高度 | int |  | 航班相对无人机高度，单位是米 |
| vert_trend | 相对高度变化趋势 | enum_int | {"0":"相对高度不变","1":"相对高度上升","2":"相对高度下降"} |  |
| distance | 航班与无人机的水平距离 | int | {"unit_name":"米 / m"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": [
		{
			"altitude": 100,
			"altitude_type": 1,
			"distance": 100,
			"heading": 89.1,
			"icao": "B-5931",
			"latitude": 12.23,
			"longitude": 12.23,
			"relative_altitude": 80,
			"vert_trend": 0,
			"warning_level": 3
		}
	],
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556,
	"method": "airsense_warning"
}
```
