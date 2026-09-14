---
title: "直播功能"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/rc-pro/live.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Service

## 设置直播镜头

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** live_lens_change

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| video_id | 直播视频流的 ID | text |  | 某路在推视频码流的标识符，格式为 *{sn}/{camera_index}/{video_index}*。其中 {sn} 为视频源设备序列号。{camera_index} 为相机索引，使用 {type-subtype-gimbalindex} 的格式。{video_index} 为该相机级别的视频源可以选择的码流索引。 |
| video_type | 直播视频流镜头类型 | enum_string | {"normal":"默认","thermal":"红外","wide":"广角","zoom":"变焦"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"video_id": "1581F5BMD228Q00A82XX/39-0-7/zoom-0",
		"video_type": "zoom"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_lens_change"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** live_lens_change

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_lens_change"
}
```

## 设置直播清晰度

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** live_set_quality

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| video_id | 直播视频流的 ID | text |  | 某路在推视频码流的标识符，格式为 *{sn}/{camera_index}/{video_index}*。其中 {sn} 为视频源设备序列号。{camera_index} 为相机索引，使用 {type-subtype-gimbalindex} 的格式。{video_index} 为该相机级别的视频源可以选择的码流索引。 |
| video_quality | 直播质量 | enum_int | {"0":"自适应","1":"流畅","2":"标清","3":"高清","4":"超清"} | 不同清晰度的分辨率与码率分别为，流畅：960 * 540、512Kbps，标清：1280 * 720、1Mbps，高清：1280 * 720、1.5Mbps，超清：1920 * 1080、3Mbps |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"video_id": "1ZNDH1D0010098/39-0-7/normal-0",
		"video_quality": 4
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_set_quality"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** live_set_quality

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
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_set_quality"
}
```

## 停止直播

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** live_stop_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| video_id | 直播视频流的 ID | text |  | 某路在推视频码流的标识符，格式为 *{sn}/{camera_index}/{video_index}*。其中 {sn} 为视频源设备序列号。{camera_index} 为相机索引，使用 {type-subtype-gimbalindex} 的格式。{video_index} 为该相机级别的视频源可以选择的码流索引。 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"video_id": "1ZNDH1D0010098/42-0-0/zoom-0"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_stop_push"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** live_stop_push

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
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_stop_push"
}
```

## 开始直播

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** live_start_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| url_type | 直播协议类型 | enum_int | {"0":"声网 Agora","1":"RTMP","3":"GB28181"} |  |
| url | 直播参数 | text |  | RTMP：（rtmp://xxxxxxx，示例：rtmp://192.168.1.1:8080/live），GB28181：（serverIP&serverPort&serverID&agentID&agentPassword&localPort&channel，示例： serverIP=192.168.1.1&serverPort=8080&serverID=34000000000000000000&agentID=300000000010000000000&agentPassword=0000000&localPort=7060&channel=340000000000000000000），声网Agora：（channel&sn&token&uid，示例： channel=1ZNDH360010162_39-0-7&sn=1ZNDH360010162&token=006dca67721582a48768ec4d817b7b25a86IAB4cw2JgN6iX8BpTPdc3e4S1Iendz94IFJ56aSXKvzAJei27MqF2zyCIgCLIIoBt41+YAQAAQC3jX5gAgC3jX5gAwC3jX5gBAC3jX5g&uid=50000）。注意：声网生成的token可能带有如 '+' 的特殊字符，需要做一次 url encode，不然 Pilot 端会出现解析错误的情况。 |
| video_id | 直播视频流的 ID | text |  | 某路在推视频码流的标识符，格式为 *{sn}/{camera_index}/{video_index}*。其中 {sn} 为视频源设备序列号。{camera_index} 为相机索引，使用 {type-subtype-gimbalindex} 的格式。{video_index} 为该相机级别的视频源可以选择的码流索引。 |
| video_quality | 直播质量 | enum_int | {"0":"自适应","1":"流畅","2":"标清","3":"高清","4":"超清"} | 不同清晰度的分辨率与码率分别为，流畅：960 * 540、512Kbps，标清：1280 * 720、1Mbps，高清：1280 * 720、1.5Mbps，超清：1920 * 1080、3Mbps |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"url": "channel=1ZNDH1D0010098_39-0-7&sn=1ZNDH1D0010098&token=006dca67721582a48768ec4d817b7b25a86IADk%2Fcm%2Fdv%2BHY6qT%2FAKM6y7TcUe4lXNvZpycH7vUMAlM6pFALUKF2zyCIgA82pQE8cCoYAQAAQDxwKhgAgDxwKhgAwDxwKhgBADxwKhg&uid=50000",
		"url_type": 0,
		"video_id": "1ZNDH1D0010098/39-0-7/normal-0",
		"video_quality": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_start_push"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** live_start_push

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
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "live_start_push"
}
```
