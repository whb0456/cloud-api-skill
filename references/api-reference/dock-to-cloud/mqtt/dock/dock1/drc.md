---
title: "指令飞行"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock1/drc.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## flyto 执行结果事件通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** fly_to_point_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| fly_to_id | 飞向目标点 ID | text |  |  |
| status | 状态 | enum_string | {"wayline_cancel":"取消飞向目标点","wayline_failed":"执行失败","wayline_ok":"执行成功，已飞向目标点","wayline_progress":"执行中"} |  |
| result | 返回码 | int |  | 非 0 代表错误 |
| way_point_index | 当前执行到第几个航点 | int |  |  |
| remaining_distance | 剩余任务距离 | float | {"step":0.1,"unit_name":"米 / m"} |  |
| remaining_time | 剩余任务时间 | float | {"step":0.1,"unit_name":"秒 / s"} |  |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 轨迹点纬度 | double | {"max":90,"min":-90} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度 | double | {"max":180,"min":-180} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"step":0.1,"unit_name":"米 / m"} | 轨迹点高度，椭球高 |

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
| result | 返回码 | int |  | 非 0 代表错误 |
| flight_id | 一键起飞任务 UUID | text |  |  |
| track_id | 航迹 ID | text |  |  |
| way_point_index | 当前执行到第几个航点 | int |  |  |
| remaining_distance | 剩余任务距离 | float | {"step":0.1,"unit_name":"米 / m"} |  |
| remaining_time | 剩余任务时间 | float | {"step":0.1,"unit_name":"秒 / s"} |  |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} |  |
| »latitude | 轨迹点纬度 | double | {"max":90,"min":-90} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度 | double | {"max":180,"min":-180} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"step":0.1,"unit_name":"米 / m"} | 轨迹点高度，椭球高 |

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

**注意：本协议不再维护且不准确，通过机场上报的设备属性”drc_state“或使用“DRC-心跳”可感知更准确的DRC链路状态。**

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

## 飞行控制—POI 环绕状态信息通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** poi_status_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| status | 状态 | enum_string | {"failed":"执行失败","in_progress":"执行中","ok":"执行成功"} |  |
| reason | 结果返回码 | int | {"0":"正常","1":"未适配负载","2":"不支持该相机模式","3":"非法命令","4":"定位失败","5":"飞行器未起飞","6":"飞行模式错误","7":"该模式下不可用（返航、降落、姿态）","8":"丢失遥控器或图传信号"} |  |
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
| result | 返回码 | int |  | 非 0 代表错误 |

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

# Service

## 飞行控制权抢夺

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flight_authority_grab

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flight_authority_grab"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flight_authority_grab

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
	"method": "flight_authority_grab"
}
```

## 负载控制权抢夺

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** payload_authority_grab

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 负载枚举值 | text |  | 镜头负载与挂载位置枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "payload_authority_grab"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** payload_authority_grab

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
	"method": "payload_authority_grab"
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
| target_latitude | 目标点纬度 | double | {"max":90,"min":-90} | 目标点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| target_longitude | 目标点经度 | double | {"max":180,"min":-180} | 目标点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| target_height | 目标点高度 | float | {"max":1500,"min":2,"step":0.1,"unit_name":"米 / m"} | 目标点高度（椭球高），使用 WGS84 模型，飞行器到点后默认行为：悬停 |
| security_takeoff_height | 安全起飞高度 | float | {"max":1500,"min":20,"step":0.1,"unit_name":"米 / m"} | 相对(机场)起飞点的高度（ALT），飞行器先升到特定的高度，然后再飞向目标点。 |
| rth_altitude | 返航高度 | int | {"max":1500,"min":2,"step":1,"unit_name":"米 / m"} | 相对(机场)起飞点的高度，相对高 ALT |
| rc_lost_action | 遥控器失控动作 | enum_int | {"0":"悬停","1":"着陆(降落)","2":"返航"} | 遥控器失控动作 |
| exit_wayline_when_rc_lost | 【废弃】航线失控动作 | enum_int | {"0":"继续执行航线任务","1":"退出航线任务，执行遥控器失控动作"} |  |
| commander_mode_lost_action | 指点飞行失控动作 | enum_int | {"0":"继续执行指点飞行任务","1":"退出指点飞行任务，执行普通失控行为"} |  |
| commander_flight_height | 指点飞行高度 | float | {"max":3000,"min":2,"step":0.1,"unit_name":"米 / m"} | 相对(机场)起飞点的高度，相对高 ALT |
| flight_id | 一键起飞任务 UUID | text |  | 任务 UUID，全局唯一，用于染色，云端区分该值是普通计划任务还是一键起飞任务 |
| max_speed | 一键起飞的飞行过程中能达到的最大速度 | int | {"max":15,"min":1,"unit_name":"米每秒 / m/s"} |  |
| simulate_mission | 是否在模拟器中执行任务 | struct |  | 可选字段，用于在室内进行模拟任务调试。；**注意：进行模拟飞行前，请务必取下桨叶，以防舱盖关闭时夹断桨叶。** |
| »is_enable | 是否开启模拟器任务 | enum_int | {"0":"不开启","1":"开启"} | 当次任务打开或关闭模拟器 |
| »latitude | 纬度 | double | {"max":"90.0","min":"-90.0"} |  |
| »longitude | 经度 | double | {"max":"180.0","min":"-180.0"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"commander_flight_height": 80,
		"commander_mode_lost_action": 1,
		"flight_id": "ABDEAC21DCADDA",
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
	"method": "takeoff_to_point"
}
```

## flyto 飞向目标点

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** fly_to_point

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| fly_to_id | 飞向目标点 ID | text |  |  |
| max_speed | flyto 的飞行过程中能达到的最大速度 | int | {"max":15,"min":0,"unit_name":"米每秒 / m/s"} |  |
| points | flyto 目标点列表 | array | {"size": -, "item_type": struct} | 仅支持 1 个目标点 |
| »latitude | 目标点纬度 | double | {"max":90,"min":-90} | 目标点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 目标点经度 | double | {"max":180,"min":-180} | 目标点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
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
| max_speed | 指令飞行过程中能达到的最大速度 | int | {"max":15,"min":1,"unit_name":"米每秒 / m/s"} |  |
| points | 更新的目标点列表 | array | {"size": -, "item_type": struct} | 仅支持 1 个目标点 |
| »latitude | 目标点纬度 | double | {"max":90,"min":-90} | 目标点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 目标点经度 | double | {"max":180,"min":-180} | 目标点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 目标点高度 | float | {"max":10000,"min":2,"step":0.1,"unit_name":"米 / m"} | 目标点高度（椭球高），使用 WGS84 模型 |

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
	"method": "fly_to_point_update"
}
```

## 负载控制—切换相机模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_mode_switch

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_mode | 相机模式 | enum_int | {"0":"拍照","1":"录像","2":"智能低光","3":"全景拍照"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_mode": 0,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_mode_switch"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_mode_switch

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
	"method": "camera_mode_switch"
}
```

## 负载控制—开始拍照

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_photo_take

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_photo_take"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_photo_take

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »status | 任务状态 | enum_string | {"in_progress":"执行中"} | 当全景拍照或其他持续性拍照行为时会上报状态信息，表达后续会有持续的进度事件上报，详细内容请查看 camera_photo_take_progress 事件 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_photo_take"
}
```

## 负载控制—停止拍照

停止拍照指令，目前仅支持全景拍照模式

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_photo_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_photo_stop"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_photo_stop

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
	"method": "camera_photo_stop"
}
```

## 负载控制—开始录像

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_recording_start

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_recording_start"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_recording_start

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
	"method": "camera_recording_start"
}
```

## 负载控制—停止录像

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_recording_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_recording_stop"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_recording_stop

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
	"method": "camera_recording_stop"
}
```

## 负载控制—画面拖动控制

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_screen_drag

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| locked | 机头和云台的相对关系是否锁定 | bool | {"false":"仅云台转，机身不转","true":"锁定机头，云台和机身一起转"} |  |
| pitch_speed | 云台 pitch 速度 | double | {"unit_name":"度每秒 / degree/s"} | 云台 pitch 速度 |
| yaw_speed | 云台 yaw 速度 | double | {"unit_name":"度每秒 / degree/s"} | 云台 yaw 速度，仅不锁机头时才生效 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"locked": true,
		"payload_index": "39-0-7",
		"pitch_speed": 0.1,
		"yaw_speed": 0.1
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_screen_drag"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_screen_drag

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
	"method": "camera_screen_drag"
}
```

## 负载控制—双击成为 AIM

双击 aim 功能为在相机镜头的视野范围内，双击镜头中的目标点，该目标点将成为镜头视野的中心

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_aim

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"ir":"红外","wide":"广角","zoom":"变焦"} |  |
| locked | 机头和云台的相对关系是否锁定 | bool | {"false":"仅云台转，机身不转","true":"锁定机头，云台和机身一起转"} |  |
| x | 目标坐标 x | double | {"max":1,"min":0} | 目标坐标 x，以镜头的左上角为坐标中心点，水平方向为 x |
| y | 目标坐标 y | double | {"max":1,"min":0} | 目标坐标 y，以镜头的左上角为坐标中心点，竖直方向为 y |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"locked": true,
		"payload_index": "39-0-7",
		"x": 0.5,
		"y": 0.5
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_aim"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_aim

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
	"method": "camera_aim"
}
```

## 负载控制—变焦

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_focal_length_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"ir":"红外","wide":"广角","zoom":"变焦"} | 相机类型枚举 |
| zoom_factor | 变焦倍数 | double | {"max":200,"min":2} | 变焦倍数，可见光是2-200，红外是2-20 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"payload_index": "39-0-7",
		"zoom_factor": 5
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_focal_length_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_focal_length_set

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
	"method": "camera_focal_length_set"
}
```

## 负载控制—重置云台

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** gimbal_reset

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 负载编号 | text |  | 负载编号，相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| reset_mode | 重置模式类型 | enum_int | {"0":"回中","1":"向下","2":"偏航回中","3":"俯仰向下"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7",
		"reset_mode": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "gimbal_reset"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** gimbal_reset

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
	"method": "gimbal_reset"
}
```

## 负载控制—Look At

lookat 功能指飞行器将从当前朝向转向实际经纬高度指定的点，在 M30/M30T 机型上建议使用锁定机头的方式，仅云台转动场景下在抵达云台限位角后 lookat 功能将出现异常

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_look_at

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| locked | 机头和云台的相对关系是否锁定 | bool | {"false":"仅云台转，机身不转","true":"锁定机头，云台和机身一起转"} |  |
| latitude | 目标点纬度 | double | {"max":90,"min":-90} | 角度值。南纬是负，北纬是正，精度到小数点后6位。 |
| longitude | 目标点经度 | double | {"max":180,"min":-180} | 角度值。东经是正，西经是负，精度到小数点后6位。 |
| height | 目标点高度 | float | {"max":10000,"min":2,"step":0.1,"unit_name":"米 / m"} | 目标点高度（椭球高） |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"height": 100,
		"latitude": 12.23,
		"locked": true,
		"longitude": 12.23,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_look_at"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_look_at

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
	"method": "camera_look_at"
}
```

## 负载控制—分屏

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_screen_split

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| enable | 是否使能分屏 | bool |  | 开启还是关闭分屏 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"enable": true,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_screen_split"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_screen_split

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
	"method": "camera_screen_split"
}
```

## 负载控制—照片存储设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** photo_storage_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| photo_storage_settings | 照片存储设置集合 | array | {"size": -, "item_type": enum_string} | 拍照存储类型{current, vision, ir}，可多选 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7",
		"photo_storage_settings": [
			"current",
			"vision",
			"ir"
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "photo_storage_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** photo_storage_set

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
	"method": "photo_storage_set"
}
```

## 负载控制—视频存储设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** video_storage_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| video_storage_settings | 视频存储设置集合 | array | {"size": -, "item_type": enum_string} | 视频存储类型{current, wide, zoom, ir}，可多选 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7",
		"video_storage_settings": [
			"current",
			"wide",
			"zoom",
			"ir"
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "video_storage_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** video_storage_set

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
	"method": "video_storage_set"
}
```

## 负载控制—相机曝光模式设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_exposure_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举 |
| exposure_mode | 曝光模式 | enum_int | {"1":"自动","2":"快门优先曝光","3":"光圈优先曝光","4":"手动曝光"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"exposure_mode": 1,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_exposure_mode_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_exposure_mode_set

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
	"method": "camera_exposure_mode_set"
}
```

## 负载控制—相机曝光值调节

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_exposure_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} |  |
| exposure_value | 曝光值 | enum_string | {"1":"-5.0EV","2":"-4.7EV","3":"-4.3EV","4":"-4.0EV","5":"-3.7EV","6":"-3.3EV","7":"-3.0EV","8":"-2.7EV","9":"-2.3EV","10":"-2.0EV","11":"-1.7EV","12":"-1.3EV","13":"-1.0EV","14":"-0.7EV","15":"-0.3EV","16":"0EV","17":"0.3EV","18":"0.7EV","19":"1.0EV","20":"1.3EV","21":"1.7EV","22":"2.0EV","23":"2.3EV","24":"2.7EV","25":"3.0EV","26":"3.3EV","27":"3.7EV","28":"4.0EV","29":"4.3EV","30":"4.7EV","31":"5.0EV","255":"FIXED"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"exposure_value": 5,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_exposure_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_exposure_set

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
	"method": "camera_exposure_set"
}
```

## 负载控制—相机对焦模式设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_focus_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举，注意: Matrice 30 系列飞行器只支持 zoom 镜头下配置该参数 |
| focus_mode | 对焦模式 | enum_int | {"0":"MF","1":"AFS","2":"AFC"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"focus_mode": 1,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_focus_mode_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_focus_mode_set

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
	"method": "camera_focus_mode_set"
}
```

## 负载控制—相机对焦值设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_focus_value_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举，注意: Matrice 30 系列飞行器只支持 zoom 镜头下配置该参数 |
| focus_value | 对焦值 | int |  | 对焦值，范围参见飞行器物模型属性 zoom_max_focus_value 和 zoom_min_focus_value |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"focus_value": 5,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_focus_value_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_focus_value_set

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
	"method": "camera_focus_value_set"
}
```

## 负载控制—点对焦

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** camera_point_focus_action

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举，注意: Matrice 30 系列飞行器只支持 zoom 镜头下配置该参数 |
| x | 对焦点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x |
| y | 对焦点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"camera_type": "zoom",
		"payload_index": "39-0-7",
		"x": 0.5,
		"y": 0.5
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "camera_point_focus_action"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** camera_point_focus_action

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
	"method": "camera_point_focus_action"
}
```

## 负载控制—红外测温模式设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** ir_metering_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| mode | 测温模式 | enum_int | {"0":"关闭测温","1":"点测温","2":"区域测温"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"mode": 1,
		"payload_index": "39-0-7"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ir_metering_mode_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** ir_metering_mode_set

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
	"method": "ir_metering_mode_set"
}
```

## 负载控制—红外测温点设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** ir_metering_point_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| x | 测温点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x |
| y | 测温点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"payload_index": "39-0-7",
		"x": 0.5,
		"y": 0.5
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ir_metering_point_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** ir_metering_point_set

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
	"method": "ir_metering_point_set"
}
```

## 负载控制—红外测温区域设置

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** ir_metering_area_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| x | 测温区域左上角点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x |
| y | 测温区域左上角点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y |
| width | 测温区域宽度 | double | {"max":1,"min":0} |  |
| height | 测温区域高度 | double | {"max":1,"min":0} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"height": 0.5,
		"payload_index": "39-0-7",
		"width": 0.5,
		"x": 0.5,
		"y": 0.5
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "ir_metering_area_set"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** ir_metering_area_set

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
	"method": "ir_metering_area_set"
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

# DRC

## DRC-飞行控制

进入指令飞行模式后允许通过该指令控制飞行器航行方向与速度，发送的频率需要保持在**5-10hz**以内让设备能够比较精准的控制速度变化与方向。

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drone_control

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| seq | 命令序号 | int |  | 递增的序号，保证指令顺序执行。若 x、y、h、w 参数发生变化，seq 需要从 0 开始增长。 |
| x | 前进后退方向的速度 | double | {"max":17,"min":-17,"unit_name":"米每秒 / m/s"} | 前进后退的最大速度，负值表示向后移动 |
| y | 左右方向的速度 | double | {"max":17,"min":-17,"unit_name":"米每秒 / m/s"} | 左右移动的最大速度，负值表示向左移动 |
| h | 上下方向的速度 | double | {"max":5,"min":-4,"unit_name":"米每秒 / m/s"} | 向上向下移动的最大速度，负值表示向下移动 |
| w | 机身角速度 | double | {"max":90,"min":-90,"unit_name":"度每秒 / degree/s"} | 顺时针与逆时针的最大角速度，负值表示逆时针转动 |

**Example:**

```
{
	"data": {
		"h": 2.76,
		"seq": 1,
		"w": 2.86,
		"x": 2.34,
		"y": -2.45
	},
	"method": "drone_control"
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drone_control

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 如果发送成功，则不会有返回码。非 0 代表错误，异常case：没有飞行控制权，没有虚拟摇杆权限，数据包序号不对 |
| output | 输出 | struct |  |  |
| »seq | 命令序号 | int |  | 递增的序号，保证指令顺序执行 |

**Example:**

```
{
	"data": {
		"output": {
			"seq": -1
		},
		"result": 319033
	},
	"method": "drone_control"
}
```

## DRC-飞行器急停

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drone_emergency_stop

**Data:** null

**Example:**

```
{
	"data": {},
	"method": "drone_emergency_stop"
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drone_emergency_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drone_emergency_stop"
}
```

## DRC-心跳

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** heart_beat

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| seq | 命令序号 | int |  | 递增的序号，保证指令顺序执行 |
| timestamp | 心跳发送时间戳 | int | {"unit_name":"毫秒 / ms"} | 业务方可以通过心跳协议判断 DRC 链路是否活跃，若一定期间未收到心跳回应可以判定 DRC 链路异常，对于 DRC 异常情况可以发起重试。若超过 5 分钟未收到业务方发送心跳协议，设备将会认为 DRC 链路处于空闲退出 DRC 链路。 |

**Example:**

```
{
	"data": {
		"seq": 10,
		"timestamp": 1670415891013
	},
	"method": "heart_beat"
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** heart_beat

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| seq | 命令序号 | int |  | 递增的序号，保证指令顺序执行 |
| timestamp | 心跳发送时间戳 | int | {"unit_name":"毫秒 / ms"} | 业务方可以通过心跳协议判断 DRC 链路是否活跃，若一定期间未收到心跳回应可以判定 DRC 链路异常，对于 DRC 异常情况可以发起重试。若超过 5 分钟未收到业务方发送心跳协议，设备将会认为 DRC 链路处于空闲退出 DRC 链路。 |

**Example:**

```
{
	"data": {
		"seq": 10,
		"timestamp": 1670415891013
	},
	"method": "heart_beat"
}
```

## DRC-避障信息上报

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** hsi_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| up_distance | 上方的障碍物距离 | int | {"unit_name":"毫米 / mm"} |  |
| down_distance | 下方的障碍物距离 | int | {"unit_name":"毫米 / mm"} |  |
| up_enable | 上视避障开关状态 | bool |  |  |
| up_work | 上视避障工作状态 | bool |  |  |
| down_enable | 下视避障开关状态 | bool |  |  |
| down_work | 下视避障工作状态 | bool |  |  |
| left_enable | 左视避障开关状态 | bool |  |  |
| left_work | 左视避障工作状态 | bool |  |  |
| right_enable | 右视避障开关状态 | bool |  |  |
| right_work | 右视避障工作状态 | bool |  |  |
| front_enable | 前视避障开关状态 | bool |  |  |
| front_work | 前视避障工作状态 | bool |  |  |
| back_enable | 后视避障开关状态 | bool |  |  |
| back_work | 后视避障工作状态 | bool |  |  |
| vertical_enable | 垂直避障开关状态 | bool |  |  |
| vertical_work | 垂直避障工作状态 | bool |  |  |
| horizontal_enable | 水平避障开关状态 | bool |  |  |
| horizontal_work | 水平避障工作状态 | bool |  |  |
| around_distances | 周边的障碍物距离 | array | {"size": 360, "item_type": int} | 水平方向观察点，分布在[0,360)的角度区间，0对应机头方向正前方，顺时针分布，例如0度为机头正前方，90度为飞行器正右方。每个数值表示该角度上障碍物与飞行器距离，60000 表示该角度没有障碍物。若上报空数组，意味任意角度都无障碍物。若上报 4 个数据的数组，意味该数据为 TOF 避障数据，在红外避障失效时上报，譬如夜晚场景。 |

**Example:**

```
{
	"method": "hsi_info_push",
	"timestamp": 1670415891013,
	"data": {
		"up_distance": 10,
		"down_distance": 10,
		"around_distance": [
			10,
			8,
			9,
			16,
			2
		],
		"up_enable": true,
		"up_work": true,
		"down_enable": true,
		"down_work": true,
		"left_enable": true,
		"left_work": true,
		"right_enable": true,
		"right_work": true,
		"front_enable": true,
		"front_work": true,
		"back_enable": true,
		"back_work": true,
		"vertical_enable": true,
		"vertical_work": true,
		"horizontal_enable": true,
		"horizontal_work": true
	}
}
```

## DRC-图传链路延时信息上报

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** delay_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| sdr_cmd_delay | 图传协议命令链路延时 | int | {"unit_name":"毫秒 / ms"} | 图传协议命令链路延时 |
| liveview_delay_list | 图传视频码流延时 | array | {"size": -, "item_type": struct} | 图传视频码流延时，多路码流 |
| »video_id | 码流编号 | text |  | 码流编号 |
| »liveview_delay_time | 码流延时 | int | {"unit_name":"毫秒 / ms"} | 码流延时 |

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
	"timestamp": 1670415891013
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
