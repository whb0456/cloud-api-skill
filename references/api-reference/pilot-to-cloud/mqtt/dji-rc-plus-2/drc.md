---
title: "指令飞行"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/drc.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 请求授权结果通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** cloud_control_auth_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非0代表错误 |
| output | 输出 | struct |  |  |
| »status | 任务状态 | enum_string | {"canceled":"有其他用户发起授权请求弹窗，本次弹窗被取消。","failed":"错误或者用户拒绝","ok":"用户同意"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"status": "ok"
		},
		"result": 0
	},
	"method": "cloud_control_auth_notify",
	"need_reply": 0,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1704038400000
}
```

## flyto 执行结果事件通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** fly_to_point_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| fly_to_id | 飞向目标点 ID | text | {"length":""} |  |
| status | 状态 | enum_string | {"wayline_cancel":"取消飞向目标点","wayline_failed":"执行失败","wayline_ok":"执行成功，已飞向目标点","wayline_progress":"执行中"} |  |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |
| way_point_index | 当前执行到第几个航点 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| remaining_distance | 剩余任务距离 | float | {"max":"","min":"","step":0.1,"unit_name":"米 / m"} |  |
| remaining_time | 剩余任务时间 | float | {"max":"","min":"","step":0.1,"unit_name":"秒 / s"} |  |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 轨迹点纬度 | double | {"max":90,"min":-90,"step":"","unit_name":null} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度 | double | {"max":180,"min":-180,"step":"","unit_name":null} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"step":0.1,"unit_name":"米 / m"} | 轨迹点高度,椭球高 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"fly_to_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"planned_path_points": [
			{
				"height": 123.234,
				"latitude": 13.23,
				"longitude": 123.234
			}
		],
		"remaining_distance": 0,
		"remaining_time": 0,
		"result": 0,
		"status": "wayline_progress",
		"way_point_index": 0
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556,
	"method": "fly_to_point_progress"
}
```

## 一键起飞结果事件通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** takeoff_to_point_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| status | 任务状态 | enum_string | {"task_finish":"一键起飞任务完成","task_ready":"准备起飞","wayline_cancel":"取消飞向目标点","wayline_failed":"执行失败","wayline_ok":"执行成功，已飞向目标点","wayline_progress":"执行中"} |  |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| flight_id | 一键起飞任务 UUID | text | {"length":""} |  |
| track_id | 航迹 ID | text | {"length":""} |  |
| way_point_index | 当前执行到第几个航点 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| remaining_distance | 剩余任务距离 | float | {"max":"","min":"","step":0.1,"unit_name":"米 / m"} |  |
| remaining_time | 剩余任务时间 | float | {"max":"","min":"","step":0.1,"unit_name":"秒 / s"} |  |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 轨迹点纬度 | double | {"max":90,"min":-90,"step":"","unit_name":null} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度 | double | {"max":180,"min":-180,"step":"","unit_name":null} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"max":"","min":"","step":0.1,"unit_name":"米 / m"} | 轨迹点高度，椭球高 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"planned_path_points": [
			{
				"height": 123.234,
				"latitude": 13.23,
				"longitude": 123.234
			}
		],
		"remaining_distance": 0,
		"remaining_time": 0,
		"result": 0,
		"status": "wayline_ok",
		"track_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"way_point_index": 1
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556,
	"method": "takeoff_to_point_progress"
}
```

## DRC 链路状态通知（已废弃）

**注意：本协议不再维护且不准确，通过遥控器上报的设备属性”drc_state“或使用“DRC-心跳”可感知更准确的DRC链路状态。**

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** drc_status_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| drc_state | DRC 状态 | enum_int | {"0":"未连接","1":"连接中","2":"已连接"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"drc_state": 2,
		"result": 0
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "drc_status_notify"
}
```

## DRC-飞行控制无效原因通知

DRC-飞行控制是一个无人机综合控制功能，若不可用，则无法使用飞行控制能力

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** joystick_invalid_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| reason | 任务状态 | int | {"0":"遥控器失联","1":"低电量返航","2":"低电量降落","3":"靠近限飞区","4":"遥控器夺权（例如：触发了返航，B控夺权）"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"reason": 0
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "joystick_invalid_notify"
}
```

## 飞行控制—进入 POI 环绕模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** poi_mode_enter

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| latitude | 目标点纬度 | double | {"max":90,"min":-90} | 角度值。南纬是负，北纬是正，精度到小数点后6位。 |
| longitude | 目标点经度 | double | {"max":180,"min":-180} | 角度值。东经是正，西经是负，精度到小数点后6位。 |
| height | 目标点高度 | float | {"max":10000,"min":2,"step":0.1,"unit_name":"米 / m"} | 目标点高度（椭球高），相对起飞点 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"height": 100,
		"latitude": 12.23,
		"longitude": 12.23
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "poi_mode_enter"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** poi_mode_enter

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
	"method": "poi_mode_enter"
}
```

## 飞行控制—退出 POI 环绕模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** poi_mode_exit

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "poi_mode_exit"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** poi_mode_exit

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
	"method": "poi_mode_exit"
}
```

## 飞行控制—POI 环绕速度设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** poi_circle_speed_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| circle_speed | 环绕速度值 | float | {"max":"以 poi_status_notify 上报的最大环绕速度为准","unit_name":"米每秒 / m/s"} | 环绕速度值，负数代表顺时针转，正数代表逆时针转 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"circle_speed": 5.2
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "poi_circle_speed_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** poi_circle_speed_set

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
	"method": "poi_circle_speed_set"
}
```

## 飞行控制—POI 环绕状态信息通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** poi_status_notify

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| status | 状态 | enum_string | {"failed":"执行失败","in_progress":"执行中","ok":"执行成功"} |  |
| reason | 结果返回码 | int | {"0":"状态正常","1":"距离目标过近","2":"距离目标过远","3":"到达限低","4":"到达限高","5":"到达限远","6":"接近限飞区","7":"云台到达限位","8":"飞机偏航达到环绕模式最大限制（±80°）","9":"障碍物距离过近","10":"定位源切换（由GPS切换为RTK），暂停环绕","11":"定位源切换（由RTK切换为GPS）","12":"避障失效","160":"正常退出","161":"未适配负载","162":"不支持该相机模式（全景、超清矩阵、精准复拍等）","163":"非法命令","164":"定位失效","165":"飞机未起飞","166":"飞行模式错误，仅N档可用","167":"该模式下不可用（返航、降落、姿态）","168":"丢失遥控器或图传信号"} |  |
| circle_radius | 环绕半径 | float | {"unit_name":"米 / m"} |  |
| circle_speed | 环绕速度 | float | {"unit_name":"米每秒 / m/s"} |  |
| max_circle_speed | 最大环绕速度 | float | {"unit_name":"米每秒 / m/s"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"circle_radius": 10.1,
		"circle_speed": 100.1,
		"max_circle_speed": 200.2,
		"reason": 0,
		"status": "in_progress"
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 16540709686556,
	"method": "poi_status_notify"
}
```

## 上报拍照进度

当拍照行为需持续进行时会通过该事件上报进度。目前仅支持：全景拍照模式

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** camera_photo_take_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| output | 输出 | struct |  |  |
| »status | 拍照状态 | enum_string | {"fail":"失败","in_progress":"执行中","ok":"完成"} |  |
| »progress | 进度 | struct |  |  |
| »»current_step | 执行步骤 | enum_int | {"3000":"全景图拍摄未开始或者已结束","3002":"全景图正在拍摄","3005":"全景图合成中"} |  |
| »»percent | 进度值 | int | {"max":"100","min":"0","step":"1"} |  |
| »ext | 扩展内容 | struct |  |  |
| »»camera_mode | 当前相机模式 | enum_int | {"3":"全景拍照"} |  |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"ext": {
				"camera_mode": 3
			},
			"progress": {
				"current_step": 0,
				"percent": 100
			},
			"status": "ok"
		},
		"result": 0
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_photo_take_progress"
}
```

## DRC-图传链路延时信息上报

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** delay_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| sdr_cmd_delay | 图传协议命令链路延时 | int | {"max":"","min":"","step":"","unit_name":"毫秒 / ms"} | 图传协议命令链路延时 |
| liveview_delay_list | 图传视频码流延时 | array | {"size": -, "item_type": struct} |  |
| »video_id | 码流编号 | text | {"length":""} | 码流编号 |
| »liveview_delay_time | 码流延时 | int | {"max":"","min":"","step":"","unit_name":"毫秒 / ms"} | 码流延时 |

**Example:**

```
{
	"data": {
		"liveview_delay_list": [
			{
				"liveview_delay_time": 60,
				"video_id": "1581BN210004555439234/52-0-0/normal-0"
			},
			{
				"liveview_delay_time": 80,
				"video_id": "1581BN210004555439234/53-0-0/normal-0"
			}
		],
		"sdr_cmd_delay": 10
	},
	"timestamp": 1670415891013,
	"method": "delay_info_push"
}
```

## DRC-避障信息上报

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** hsi_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| up_distance | 上方的障碍物距离 | int | {"max":"","min":"","step":"","unit_name":"毫米 / mm"} |  |
| down_distance | 下方的障碍物距离 | int | {"max":"","min":"","step":"","unit_name":"毫米 / mm"} |  |
| up_enable | 上视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| up_work | 上视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| down_enable | 下视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| down_work | 下视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| around_distances | 周边的障碍物距离 | array | {"size": -, "item_type": int} |  |
| left_enable | 左视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| left_work | 左视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| right_enable | 右视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| right_work | 右视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| front_enable | 前视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| front_work | 前视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| back_enable | 后视避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| back_work | 后视避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| vertical_enable | 垂直避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| vertical_work | 垂直避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |
| horizontal_enable | 水平避障开关状态 | bool | {"0":"关闭","1":"开启"} |  |
| horizontal_work | 水平避障工作状态 | bool | {"0":"关闭","1":"开启"} |  |

**Example:**

```
{
	"data": {
		"around_distance": [
			10,
			8,
			9,
			16,
			2
		],
		"back_enable": true,
		"back_work": true,
		"down_distance": 10,
		"down_enable": true,
		"down_work": true,
		"front_enable": true,
		"front_work": true,
		"horizontal_enable": true,
		"horizontal_work": true,
		"left_enable": true,
		"left_work": true,
		"right_enable": true,
		"right_work": true,
		"up_distance": 10,
		"up_enable": true,
		"up_work": true,
		"vertical_enable": true,
		"vertical_work": true
	},
	"timestamp": 1670415891013,
	"method": "hsi_info_push"
}
```

## 返航信息

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** return_home_info

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 轨迹点纬度(角度值) | double | {"max":90,"min":-90} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度(角度值) | double | {"max":180,"min":-180} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"max":"","min":"","step":0.1,"unit_name":"米 / m"} | 轨迹点高度，椭球高 |
| flight_id | 任务 ID | text | {"length":""} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"planned_path_points": [
			{
				"height": 107.91999816894531,
				"latitude": 22.591622374020517,
				"longitude": 114.00506408885121
			},
			{
				"height": 107.91999816894531,
				"latitude": 22.591547439806163,
				"longitude": 114.00506366975605
			}
		]
	},
	"gateway": "7XJDLC10010639",
	"method": "return_home_info",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1734446832046
}
```

# Service

## 请求授权云端控制

请求后，遥控器会出现“请求授权”的弹窗。

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** cloud_control_auth_request

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| user_id | 用户ID | text | {"length":""} | 请求授权的云端用户ID。 |
| user_callsign | 用户呼号 | text | {"length":""} | 请求授权的云端用户昵称。 |
| control_keys | 控制权的键 | array | {"size": 1, "item_type": text} | 请求飞行控制权，请填写“flight”。 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"control_keys": [
			"flight"
		],
		"user_callsign": "xxxxxxx",
		"user_id": "xxxxxxxxxxx"
	},
	"method": "cloud_control_auth_request",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1704038400000
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** cloud_control_auth_request

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非0代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"status": "ok"
		},
		"result": 0
	},
	"method": "cloud_control_auth_request",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1704038400000
}
```

## 释放云端控制

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** cloud_control_release

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| control_keys | 控制权列表 | array | {"size": 1, "item_type": text} | 需要释放的控制权列表。“flight”代表飞行控制权。 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"control_keys": [
			"flight"
		]
	},
	"method": "cloud_control_release",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1704038400000
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** cloud_control_release

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非0代表错误 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"status": "ok"
		},
		"result": 0
	},
	"method": "cloud_control_release",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1704038400000
}
```

## 进入指令飞行控制模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** drc_mode_enter

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| mqtt_broker | Broker 连接信息 | struct |  | 获取 MQTT 中继服务的地址与认证信息 |
| »address | 服务器连接地址 | text |  | 服务器连接地址，例如：192.0.2.1:8883, mqtt.dji.com:8883 |
| »client_id | 客户端 ID | text |  | 可自定义的 MQTT 客户端 ID。建议使用设备的 SN 码，也可以与具有语义的前缀组合，例如，drc-4J4R101 |
| »username | 用户名 | text |  | 建立连接时使用的用户名 |
| »password | 密码 | text |  | 建立连接时认证所需要的密码 |
| »expire_time | 认证信息过期时间 | int | {"unit_name":"秒 / s"} | 在有效期内认证信息可以重复使用，另外认证信息过期后，并不会影响已建立连接的设备 |
| »enable_tls | 是否启用 TLS | bool |  | 启用 TLS 即对 MQTT 链路开启加密 |
| osd_frequency | OSD 频率 | int | {"max":30,"min":1,"unit_name":"赫兹 / Hz"} | 设置 OSD 上报频率 |
| hsi_frequency | HSI 频率 | int | {"max":30,"min":1,"unit_name":"赫兹 / Hz"} | 设置 HSI 上报频率 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"hsi_frequency": 1,
		"mqtt_broker": {
			"address": "mqtt.dji.com:8883",
			"client_id": "sn_a",
			"enable_tls": true,
			"expire_time": 1672744922,
			"password": "jwt_token",
			"username": "sn_a_username"
		},
		"osd_frequency": 10
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "drc_mode_enter"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** drc_mode_enter

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
	"method": "drc_mode_enter"
}
```

## 退出指令飞行控制模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** drc_mode_exit

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "drc_mode_exit"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** drc_mode_exit

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
	"method": "drc_mode_exit"
}
```

## 一键起飞

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** takeoff_to_point

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| target_latitude | 目标点纬度(角度值) | double | {"max":90,"min":-90,"step":"","unit_name":null} |  |
| target_longitude | 目标点经度(角度值) | double | {"max":180,"min":-180,"step":"","unit_name":null} |  |
| target_height | 目标点高度 | float | {"max":1500,"min":2,"step":0.1,"unit_name":"米 / m"} |  |
| security_takeoff_height | 安全起飞高度 | float | {"max":1500,"min":20,"step":0.1,"unit_name":"米 / m"} |  |
| rth_mode | 【必填】返航模式设置值 | enum_int | {"0":"智能高度","1":"设定高度"} |  |
| rth_altitude | 返航高度 | int | {"max":1500,"min":2,"step":1,"unit_name":"米 / m"} |  |
| rc_lost_action | 遥控器失控动作 | enum_int | {"0":"悬停","1":"着陆(降落)","2":"返航"} |  |
| commander_mode_lost_action | 【必填】指点飞行失控动作 | enum_int | {"0":"继续执行指点飞行任务","1":"退出指点飞行任务，执行普通失控行为"} |  |
| commander_flight_mode | 【必填】指点飞行模式设置值 | enum_int | {"0":"智能高度飞行","1":"设定高度飞行"} |  |
| commander_flight_height | 【必填】指点飞行高度 | float | {"max":3000,"min":2,"step":0.1,"unit_name":"米 / m"} |  |
| flight_id | 一键起飞任务 UUID | text | {"length":""} |  |
| max_speed | 一键起飞的飞行过程中能达到的最大速度 | int | {"max":15,"min":1,"step":"","unit_name":"米每秒 / m/s"} |  |
| flight_safety_advance_check | 飞行安全预检查 | bool | {"0":"关闭","1":"开启"} | 设置一键起飞和航线任务中的飞行安全是否预先检查。此字段为可选，默认为0，值为0表示关闭，1表示开启。飞行安全预先检查表示: 飞行器执行任务前，检查自身作业区文件是否与云端一致，如果不一致则拉取文件更新，如果一致则不处理 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"commander_flight_height": 80,
		"commander_mode_lost_action": 1,
		"flight_id": "ABDEAC21DCADDA",
		"flight_safety_advance_check": 1,
		"max_speed": 12,
		"rc_lost_action": 0,
		"rth_altitude": 100,
		"security_takeoff_height": 100,
		"target_height": 100,
		"target_latitude": 12.23,
		"target_longitude": 12.32
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "takeoff_to_point"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** takeoff_to_point

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "takeoff_to_point"
}
```

## flyto 飞向目标点

特别说明：飞机有最低飞行高度(20m)安全保障机制，如果飞机相对起飞点高度低于20m，会先上升到20m

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** fly_to_point

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| fly_to_id | 飞向目标点 ID | text |  |  |
| max_speed | flyto 的飞行过程中能达到的最大速度 | int | {"max":15,"min":0,"unit_name":"米每秒 / m/s"} |  |
| points | flyto 目标点列表 | array | {"size": -, "item_type": struct} | 仅支持 1 个目标点 |
| »latitude | 目标点纬度(角度值) | double | {"max":90,"min":-90} | 目标点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 目标点经度(角度值) | double | {"max":180,"min":-180} | 目标点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 目标点高度 | float | {"max":10000,"min":2,"step":0.1,"unit_name":"米 / m"} | 目标点高度（椭球高），使用 WGS84 模型 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"fly_to_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"max_speed": 12,
		"points": [
			{
				"height": 100,
				"latitude": 12.23,
				"longitude": 12.23
			}
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "fly_to_point"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** fly_to_point

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
	"method": "fly_to_point"
}
```

## 结束 flyto 飞向目标点任务

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** fly_to_point_stop

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "fly_to_point_stop"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** fly_to_point_stop

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
	"method": "fly_to_point_stop"
}
```

## 更新 flyto 目标点

「一键起飞」或「flyto 飞向目标点」的过程中，可以通过该命令快速更新目标点

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** fly_to_point_update

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| max_speed | 指令飞行过程中能达到的最大速度 | int | {"max":"15","min":"1","step":"","unit_name":"米每秒 / m/s"} |  |
| points | 更新的目标点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 维度 | double | {"max":"","min":"","step":"","unit_name":null} |  |
| »longitude | 维度 | double | {"max":"","min":"","step":"","unit_name":null} |  |
| »height | 高度 | float | {"max":"","min":"","step":"","unit_name":null} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"max_speed": 12,
		"points": [
			{
				"height": 100,
				"latitude": 12.23,
				"longitude": 12.23
			}
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "fly_to_point_update"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** fly_to_point_update

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
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "fly_to_point_update"
}
```

## 一键返航

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** return_home

**Data:** null

**Example:**

```
{
	"bid": "f9f07aad-d1f1-4dc1-8ad0-a3417fd365cc",
	"data": null,
	"method": "return_home",
	"tid": "b103b00a-3fcc-476e-9cb6-bc5e27d2defd",
	"timestamp": 1734425015702
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** return_home

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |

**Example:**

```
{
	"bid": "f9f07aad-d1f1-4dc1-8ad0-a3417fd365cc",
	"data": {
		"result": 0
	},
	"method": "return_home",
	"tid": "b103b00a-3fcc-476e-9cb6-bc5e27d2defd",
	"timestamp": 1734425014635
}
```

## 取消返航

返航后，飞行器会退出航线模式，此时取消返航，飞行器会悬停

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** return_home_cancel

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "return_home_cancel"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** return_home_cancel

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
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "return_home_cancel"
}
```

## DRC-高频 osd 信息上报

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** osd_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| attitude_head | 飞行器姿态 head 角 | double | {"unit_name":"度 / °"} | 飞行器姿态 head 角 |
| latitude | 飞行器纬度 | double | {"unit_name":"度 / °"} |  |
| longitude | 飞行器经度 | double | {"unit_name":"度 / °"} |  |
| height | 飞行器高度 | double | {"unit_name":"度 / °"} | 飞行器海拔高度 |
| speed_x | 当前飞行器 x 坐标方向的速度 | double | {"unit_name":"米每秒 / m/s"} | 当前飞行器 x 坐标方向的速度 |
| speed_y | 当前飞行器 y 坐标方向的速度 | double | {"unit_name":"米每秒 / m/s"} | 当前飞行器 y 坐标方向的速度 |
| speed_z | 当前飞行器 z 坐标方向的速度 | double | {"unit_name":"米每秒 / m/s"} |  |
| gimbal_pitch | 云台 pitch 角 | double | {"unit_name":"度 / °"} |  |
| gimbal_roll | 云台 roll 角 | double | {"unit_name":"度 / °"} |  |
| gimbal_yaw | 云台 yaw 角 | double | {"unit_name":"度 / °"} |  |

**Example:**

```
{
	"data": {
		"attitude_head": 60,
		"gimbal_pitch": 60,
		"gimbal_roll": 60,
		"gimbal_yaw": 60,
		"height": 10,
		"latitude": 10,
		"longitude": 10,
		"speed_x": 10,
		"speed_y": 10,
		"speed_z": 10
	},
	"timestamp": 1670415891013
}
```
