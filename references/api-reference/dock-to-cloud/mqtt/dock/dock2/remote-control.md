---
title: "远程控制"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock2/remote-control.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 拍照信息上报

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_photo_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| countdown_time | 定时拍倒计时 | int |  |  |
| result | 拍照结果 | int |  | 非 0 代表错误 |
| status | 状态 | enum_string | {"fail":"失败","in_progress":"执行中","ok":"完成"} |  |
| progress | 进度 | struct |  |  |
| »current_step | 执行步骤 | enum_int | {"3000":"全景图拍摄未开始或者已结束","3002":"全景图正在拍摄","3005":"全景图合成中"} |  |
| »percent | 进度值 | int | {"max":"100","min":"0","step":"","unit_name":null} |  |
| ext | 扩展内容 | struct |  |  |
| »camera_mode | 当前相机模式 | enum_int | {"3":"全景拍照"} |  |

**Example:**

```
{
	"data": {
		"countdown_time": 4,
		"ext": {
			"camera_mode": 2
		},
		"progress": {
			"current_step": 0,
			"percent": 100
		},
		"result": 0,
		"status": "in_progress"
	},
	"method": "drc_camera_photo_info_push",
	"seq": 1
}
```

## 相机状态上报

变化时推送相机信息（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_state_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_state | 相机状态信息 | struct |  |  |
| »camera_mode | 相机状态 | enum_int | {"0":"拍照","1":"录像","2":"智能低光","3":"全景拍照","4":"定时拍照"} |  |
| »interval_photo_interval | 定时拍照间隔 | int | {"max":"","min":"","step":"","unit_name":"秒 / s"} |  |
| »video_resolution | 视频分辨率大小 | enum_string | {"0":"1920*1080 ","1":"3840*2160"} |  |
| »linkage_zoom_state | 联动变焦状态 | bool | {"0":"关闭","1":"开启"} |  |
| »photo_size | 照片大小 | enum_int | {"0":"默认大小","1":"特小","2":"小","3":"中","4":"大","5":"特大"} |  |
| »record_time | 视频录制时长 | int | {"max":"","min":"","step":"","unit_name":"秒 / s"} |  |
| »recording_state | 录像状态 | enum_int | {"0":"空闲","1":"录像中"} |  |
| »photo_state | 拍照状态 | enum_int | {"0":"空闲","1":"拍照中"} |  |
| »remain_photo_num | 剩余拍照张数 | int |  |  |
| »remain_record_duration | 剩余录像时间 | int | {"max":"","min":"","step":"","unit_name":"秒 / s"} |  |
| media_storage | 媒体存储信息 | struct |  |  |
| »photo_storage_settings | 照片存储设置集合 | array | {"size": -, "item_type": text} | 拍照存储类型{current, vision, ir}，根据机型可多选 |
| »video_storage_settings | 视频存储设置集合 | array | {"size": -, "item_type": text} | 视频存储类型{current, vision, ir}，根据机型可多选 |

**Example:**

```
{
	"data": {
		"camera_state": {
			"camera_mode": 0,
			"interval_photo_interval": 2.5,
			"linkage_zoom_state": 0,
			"photo_size": 1,
			"photo_state": 0,
			"record_time": 0,
			"recording_state": 0,
			"remain_photo_num": 6727,
			"remain_record_duration": 0,
			"video_resolution": 0
		},
		"media_storage": {
			"photo_storage_settings": [
				"current",
				"ir"
			],
			"video_storage_settings": [
				"current",
				"ir"
			]
		},
		"payload_index": "81-0-0"
	},
	"method": "drc_camera_state_push",
	"seq": 1
}
```

## 飞行器状态信息上报

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_drone_state_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| stealth_state | 隐蔽模式状态 | bool | {"0":"关闭","1":"开启"} |  |
| night_lights_state | 夜航灯状态 | bool | {"0":"关闭","1":"开启"} |  |
| mode_code | 飞行器状态 | enum_int | {"0":"待机","1":"起飞准备","2":"起飞准备完毕","3":"手动飞行","4":"自动起飞","5":"航线飞行","6":"全景拍照","7":"智能跟随","8":"ADS-B 躲避","9":"自动返航","10":"自动降落","11":"强制降落","12":"三桨叶降落","13":"升级中","14":"未连接","15":"APAS","16":"虚拟摇杆状态","17":"指令飞行"} |  |
| landing_type | 降落类型 | enum_int | {"0":"未降落","1":"机场内降落","2":"备降点降落","3":"用户主动触发降落","4":"飞行器自身触发降落"} |  |
| landing_protection_type | 降落检测类型 | enum_int | {"0":"未开启检测","1":"检测到地面不平或者下方是水面，不适合降落，降落任务退出","2":"没有检测出地面情况，降落任务退出","3":"机场内降落检测"} | 开启避障情况下紧急降落，飞行器会开启降落检测 |

**Example:**

```
{
	"data": {
		"landing_protection_type": 0,
		"landing_type": 1,
		"mode_code": 0,
		"night_lights_state": 0,
		"stealth_state": 0
	},
	"method": "drc_drone_state_push",
	"seq": 1
}
```

## 摄像头 osd 推送

用于推送摄像头参数信息（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_osd_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| wide_lense | 广角镜头信息 | struct |  |  |
| »wide_exposure_mode | 广角镜头曝光模式 | enum_int | {"1":"自动","2":"快门优先曝光","3":"光圈优先曝光","4":"手动曝光"} | 当前配置的广角镜头曝光模式 |
| »wide_iso | 广角镜头感光度 | enum_int | {"0":"Auto","1":"Auto(High Sense)","2":"50","3":"100","4":"200","5":"400","6":"800","7":"1600","8":"3200","9":"6400","10":"12800","11":"25600","255":"FIXED"} | 当前配置的广角镜头感光度 |
| »wide_shutter_speed | 广角镜头快门速度 | enum_int | {"0":"1/8000 s","1":"1/6400 s","2":"1/6000 s","3":"1/5000 s","4":"1/4000 s","5":"1/3200 s","6":"1/3000 s","7":"1/2500 s","8":"1/2000 s","9":"1/1600 s","10":"1/1500 s","11":"1/1250 s","12":"1/1000 s","13":"1/800 s","14":"1/725 s","15":"1/640 s","16":"1/500 s","17":"1/400 s","18":"1/350 s","19":"1/320 s","20":"1/250 s","21":"1/240 s","22":"1/200 s","23":"1/180 s","24":"1/160 s","25":"1/125 s","26":"1/120 s","27":"1/100 s","28":"1/90 s","29":"1/80 s","30":"1/60 s","31":"1/50 s","32":"1/40 s","33":"1/30 s","34":"1/25 s","35":"1/20 s","36":"1/15 s","37":"1/12.5 s","38":"1/10 s","39":"1/8 s","40":"1/6.25 s","41":"1/5 s","42":"1/4 s","43":"1/3 s","44":"1/2.5 s","45":"1/2 s","46":"1/1.67 s","47":"1/1.25 s","48":"1.0 s","49":"1.3 s","50":"1.6 s","51":"2.0 s","52":"2.5 s","53":"3.0 s","54":"3.2 s","55":"4.0 s","56":"5.0 s","57":"6.0 s","58":"7.0 s","59":"8.0 s","65534":"Auto"} | 当前配置的广角镜头快门速度 |
| »wide_exposure_value | 广角镜头曝光值 | enum_int | {"1":"-5.0EV","2":"-4.7EV","3":"-4.3EV","4":"-4.0EV","5":"-3.7EV","6":"-3.3EV","7":"-3.0EV","8":"-2.7EV","9":"-2.3EV","10":"-2.0EV","11":"-1.7EV","12":"-1.3EV","13":"-1.0EV","14":"-0.7EV","15":"-0.3EV","16":"0EV","17":"0.3EV","18":"0.7EV","19":"1.0EV","20":"1.3EV","21":"1.7EV","22":"2.0EV","23":"2.3EV","24":"2.7EV","25":"3.0EV","26":"3.3EV","27":"3.7EV","28":"4.0EV","29":"4.3EV","30":"4.7EV","31":"5.0EV","255":"FIXED"} | 当前配置的广角镜头曝光值 |
| »wide_aperture_value | 光圈值 | enum_int | {"0":"F_AUTO","50":"F0.5","70":"F0.7","80":"F0.8","90":"F0.9","95":"F0.95","100":"F1.0","110":"F1.1","120":"F1.2","140":"F1.4","160":"F1.6","170":"F1.7","180":"F1.8","200":"F2","220":"F2.2","240":"F2.4","250":"F2.5","280":"F2.8","320":"F3.2","330":"F3.3","340":"F3.4","350":"F3.5","400":"F4","440":"F4.4","450":"F4.5","480":"F4.8","500":"F5","560":"F5.6","630":"F6.3","670":"F6.7","680":"F6.8","710":"F7.1","800":"F8","900":"F9","950":"F9.5","960":"F9.6","1000":"F10","1100":"F11","1300":"F13","1400":"F14","1600":"F16","1800":"F18","1900":"F19","2000":"F20","2200":"F22","2500":"F25","2700":"F27","2900":"F29","3200":"F32","3600":"F36","3800":"F38","4000":"F40","4500":"F45","5100":"F51","5400":"F54","5700":"F57","6400":"F64","7200":"F72","7600":"F76","8000":"F80","9000":"F90","10700":"F107","12800":"F128","18000":"F180","25600":"F256"} | 根据不同机型，范围不一致 |
| zoom_lense | 变焦镜头信息 | struct |  |  |
| »zoom_exposure_mode | 变焦镜头曝光模式 | enum_int | {"1":"自动","2":"快门优先曝光","3":"光圈优先曝光","4":"手动曝光"} | 当前配置的变焦镜头曝光模式 |
| »zoom_iso | 变焦镜头感光度 | enum_int | {"0":"Auto","1":"Auto(High Sense)","2":"50","3":"100","4":"200","5":"400","6":"800","7":"1600","8":"3200","9":"6400","10":"12800","11":"25600","255":"FIXED"} | 当前配置的变焦镜头感光度 |
| »zoom_shutter_speed | 变焦镜头快门速度 | enum_int | {"0":"1/8000 s","1":"1/6400 s","2":"1/6000 s","3":"1/5000 s","4":"1/4000 s","5":"1/3200 s","6":"1/3000 s","7":"1/2500 s","8":"1/2000 s","9":"1/1600 s","10":"1/1500 s","11":"1/1250 s","12":"1/1000 s","13":"1/800 s","14":"1/725 s","15":"1/640 s","16":"1/500 s","17":"1/400 s","18":"1/350 s","19":"1/320 s","20":"1/250 s","21":"1/240 s","22":"1/200 s","23":"1/180 s","24":"1/160 s","25":"1/125 s","26":"1/120 s","27":"1/100 s","28":"1/90 s","29":"1/80 s","30":"1/60 s","31":"1/50 s","32":"1/40 s","33":"1/30 s","34":"1/25 s","35":"1/20 s","36":"1/15 s","37":"1/12.5 s","38":"1/10 s","39":"1/8 s","40":"1/6.25 s","41":"1/5 s","42":"1/4 s","43":"1/3 s","44":"1/2.5 s","45":"1/2 s","46":"1/1.67 s","47":"1/1.25 s","48":"1.0 s","49":"1.3 s","50":"1.6 s","51":"2.0 s","52":"2.5 s","53":"3.0 s","54":"3.2 s","55":"4.0 s","56":"5.0 s","57":"6.0 s","58":"7.0 s","59":"8.0 s","65534":"Auto"} | 当前配置的变焦镜头快门速度 |
| »zoom_exposure_value | 变焦镜头曝光值 | enum_int | {"1":"-5.0EV","2":"-4.7EV","3":"-4.3EV","4":"-4.0EV","5":"-3.7EV","6":"-3.3EV","7":"-3.0EV","8":"-2.7EV","9":"-2.3EV","10":"-2.0EV","11":"-1.7EV","12":"-1.3EV","13":"-1.0EV","14":"-0.7EV","15":"-0.3EV","16":"0EV","17":"0.3EV","18":"0.7EV","19":"1.0EV","20":"1.3EV","21":"1.7EV","22":"2.0EV","23":"2.3EV","24":"2.7EV","25":"3.0EV","26":"3.3EV","27":"3.7EV","28":"4.0EV","29":"4.3EV","30":"4.7EV","31":"5.0EV","255":"FIXED"} | 当前配置的变焦镜头曝光值 |
| »zoom_focus_mode | 变焦镜头对焦模式 | enum_int | {"0":"MF","1":"AFS","2":"AFC"} |  |
| »zoom_focus_value | 变焦镜头对焦值 | int |  |  |
| »zoom_max_focus_value | 变焦镜头最大对焦值 | int |  |  |
| »zoom_min_focus_value | 变焦镜头最小对焦值 | int |  |  |
| »zoom_calibrate_farthest_focus_value | 变焦镜头标定的最远对焦值 | int |  | 最清晰的最远位置对焦值 |
| »zoom_calibrate_nearest_focus_value | 变焦镜头标定的最近对焦值 | int |  | 最清晰的最近位置对焦值 |
| »zoom_focus_state | 变焦镜头对焦状态 | int |  |  |
| »zoom_factor | 变焦倍数 | int |  |  |
| »zoom_aperture_value | 变焦光圈值 | enum_int | {"440":"F4.4"} | 根据不同机型，范围不一致 |
| measure_target | 目标测距和测高 | struct |  |  |
| »measure_target_longitude | 激光测距目标经度 | double | {"max":"180","min":"-180","unit":"度 / °"} |  |
| »measure_target_latitude | 激光测距目标纬度 | double | {"max":"90","min":"-90","unit":"度 / °"} |  |
| »measure_target_altitude | 激光测距目标海拔 | double | {"unit":"米 / m"} |  |
| »measure_target_distance | 激光测距距离 | double | {"unit":"米 / m"} |  |
| ir_lense | 红外信息 | struct |  |  |
| »screen_split_enable | 分屏是否使能 | bool | {"false":"分屏使能关闭","true":"分屏使能开启"} |  |
| »ir_zoom_factor | 红外变焦倍数 | float | {"max":20,"min":2} | 红外变焦倍数 |
| »thermal_supported_palette_styles | 设备支持的调色盘样式集合 | array | {"size": -, "item_type": enum_int} | 不同设备所支持的样式能力有所不同 |
| »thermal_gain_mode | 增益模式 | enum_int | {"0":"自动","1":"低增益, 测温范围0°C-500°C","2":"高增益, 测温范围-20°C-150°C"} | 低增益提供更大的测温范围，高增益拥有更高的测温精度 |
| »thermal_isotherm_state | 是否开启等温线 | enum_int | {"0":"关闭","1":"开启"} | 等温线允许用户观测自己感兴趣的温度区间的内容，让兴趣温度区间的物体能更加凸显 |
| »thermal_isotherm_upper_limit | 测温区间上限 | int | {"unit":"摄氏度 / °C"} | 仅启用等温线功能后有效 |
| »thermal_isotherm_lower_limit | 测温区间下限 | int | {"unit":"摄氏度 / °C"} | 仅启用等温线功能后有效 |
| »thermal_global_temperature_min | 全局画面中测量的最低温度 | float | {"unit":"摄氏度 / °C"} |  |
| »thermal_global_temperature_max | 全局画面中测量的最高温度 | float | {"unit":"摄氏度 / °C"} |  |
| liveview | 直播视图区域信息 | struct |  |  |
| »liveview_world_region | 视场角（FOV）在 liveview 中的区域 | struct |  | 变焦相机的视场角相对于广角相机或者红外相机的视场角，在 liveview 中会有所不同。坐标原点为镜头左上角。 |
| »»left | 左上角的 x 轴起始点 | float |  | 左上角的 x 轴起始点 |
| »»top | 左上角的 y 轴起始点 | float |  | 左上角的 y 轴起始点 |
| »»right | 右下角的 x 轴起始点 | float |  | 右下角的 x 轴起始点 |
| »»bottom | 右下角的 y 轴起始点 | float |  | 右下角的 y 轴起始点 |

**Example:**

```
{
	"data": {
		"ir_lense": {
			"ir_zoom_factor": 2,
			"screen_split_enable": false,
			"thermal_current_palette_style": 11,
			"thermal_gain_mode": 2,
			"thermal_global_temperature_max": 40.0373764038086,
			"thermal_global_temperature_min": 31.65154457092285,
			"thermal_isotherm_lower_limit": -20,
			"thermal_isotherm_state": 0,
			"thermal_isotherm_upper_limit": 150
		},
		"liveview": {
			"liveview_world_region": {
				"bottom": 0.5609484910964966,
				"left": 0.43238765001297,
				"right": 0.5639060735702515,
				"top": 0.433199942111969
			}
		},
		"measure_target": {
			"measure_target_altitude": 34.60000228881836,
			"measure_target_distance": 0,
			"measure_target_error_state": 1,
			"measure_target_latitude": 22.907619920797877,
			"measure_target_longitude": 113.70345426744846
		},
		"payload_index": "81-0-0",
		"wide_lense": {
			"wide_aperture_value": 10,
			"wide_exposure_mode": 1,
			"wide_exposure_value": 16,
			"wide_iso": 8,
			"wide_shutter_speed": 45
		},
		"zoom_lense": {
			"zoom_aperture_value": 10,
			"zoom_calibrate_farthest_focus_value": 34,
			"zoom_calibrate_nearest_focus_value": 64,
			"zoom_exposure_mode": 1,
			"zoom_exposure_value": 16,
			"zoom_factor": 6.999994214380596,
			"zoom_focus_mode": 0,
			"zoom_focus_state": 0,
			"zoom_focus_value": 34,
			"zoom_iso": 8,
			"zoom_max_focus_value": 64,
			"zoom_min_focus_value": 33,
			"zoom_shutter_speed": 45
		}
	},
	"method": "drc_camera_osd_info_push",
	"seq": 1
}
```

# Service

## 负载控制—切换相机模式

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_mode_switch

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_mode | 模式 | enum_int | {"0":"拍照","1":"录像","2":"智能低光","3":"全景拍照","4":"定时拍"} |  |

**Example:**

```
{
    "data": {
        "camera_mode": 2,
        "payload_index": "81-0-0"
    },
    "method": "drc_camera_mode_switch",
    "seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** drc_camera_mode_switch

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
    "method": "drc_camera_mode_switch",
    "seq": 1
}
```

## 强制降落

调用后，无论是否有障碍飞行器都会直接降到地面，用 drone_emergency_stop 命令可取消。降落完成后只能人工拾取飞行器，慎用!（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_force_landing

**Data:** null

**Example:**

```
{
	"data": {},
	"method": "drc_force_landing",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_force_landing

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
	"method": "drc_force_landing",
	"seq": 1
}
```

## 急停

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drone_emergency_stop

**Data:** null

**Example:**

```
{
	"data": {},
	"method": "drone_emergency_stop",
	"seq": 1
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
	"method": "drone_emergency_stop",
	"seq": 1
}
```

## 紧急降落

调用后，飞行器会开始降落，在开启避障时可能会因触发避障而中止。用 drone_emergency_stop 命令可取消。降落完成后只能人工拾取飞行器，慎用！（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_emergency_landing

**Data:** null

**Example:**

```
{
	"data": {},
	"method": "drc_emergency_landing",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_emergency_landing

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
	"method": "drc_emergency_landing",
	"seq": 1
}
```

## 负载控制—红外联动变焦

红外联动变焦仅支持 Matrice 3TD 机型（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_linkage_zoom_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| state | 联动变焦状态 | bool | {"0":"关闭","1":"开启"} |  |

**Example:**

```
{
	"data": {
		"payload_index": "81-0-0",
		"state": 0
	},
	"method": "drc_linkage_zoom_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_linkage_zoom_set

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
	"method": "drc_linkage_zoom_set",
	"seq": 1
}
```

## 负载控制—视频分辨率设置

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_video_resolution_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| video_resolution | 视频分辨率 | enum_string | {"0":"1920*1080","1":"3840*2160"} | 可见光相机分辨率分别为 1920*1080、3840*2160。红外相机仅支持 640*512，无法设置 |

**Example:**

```
{
	"data": {
		"payload_index": "81-0-0",
		"video_resolution": 0
	},
	"method": "drc_video_resolution_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_video_resolution_set

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
	"method": "drc_video_resolution_set",
	"seq": 1
}
```

## 负载控制—视频存储设置

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_video_storage_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| video_storage_settings | 视频存储 | array | {"size": -, "item_type": text} | 视频存储类型{current, vision, ir}，根据机型可多选 |

**Example:**

```
{
	"data": {
		"payload_index": "81-0-0",
		"video_storage_settings": [
			"current",
			"ir",
			"vision"
		]
	},
	"method": "drc_video_storage_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_video_storage_set

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
	"method": "drc_video_storage_set",
	"seq": 1
}
```

## 负载控制—照片存储设置

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_photo_storage_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| photo_storage_settings | 照片存储设置 | array | {"size": -, "item_type": text} | 拍照存储类型{current, vision, ir}，根据机型可多选 |

**Example:**

```
{
	"data": {
		"payload_index": "81-0-0",
		"photo_storage_settings": [
			"current",
			"ir",
			"vision"
		]
	},
	"method": "drc_photo_storage_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_photo_storage_set

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
	"method": "drc_photo_storage_set",
	"seq": 1
}
```

## 负载控制—设置定时拍

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_interval_photo_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| interval | 定时拍照间隔 | enum_string | {"1":"1s","2":"2s","3":"3s","5":"5s","7":"7s","10":"10s","15":"15s","20":"20s","30":"30s","60":"60s","0.7":"0.7s"} | 不同照片尺寸取值范围不一样。照片尺寸在 8K 以下时拍照间隔的设置没有限制。8K 照片不能设置0.7s 和 1s。请忽略照片尺寸在 8K 以上的场景。 |

**Example:**

```
{
	"data": {
		"interval": 1,
		"payload_index": "80-0-0"
	},
	"method": "drc_interval_photo_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_interval_photo_set

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
	"method": "drc_interval_photo_set",
	"seq": 1
}
```

## DRC初始状态订阅

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_initial_state_subscribe

**Data:** null

**Example:**

```
{
	"data": {},
	"method": "drc_initial_state_subscribe",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_initial_state_subscribe

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
	"method": "drc_initial_state_subscribe",
	"seq": 1
}
```

## 夜航灯设置

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_night_lights_state_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| night_lights_state | 状态 | enum_int | {"0":"关闭","1":"开启"} |  |

**Example:**

```
{
	"data": {
		"night_lights_state": 0
	},
	"method": "drc_night_lights_state_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_night_lights_state_set

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
	"method": "drc_night_lights_state_set",
	"seq": 1
}
```

## 飞行控制—隐蔽模式

设置飞行器的隐蔽模式，用于关闭所有飞行器灯光（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_stealth_state_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| stealth_state | 隐蔽模式 | enum_int | {"0":"关闭","1":"开启"} | 隐蔽模式状态 |

**Example:**

```
{
	"data": {
		"stealth_state": 0
	},
	"method": "drc_stealth_state_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_stealth_state_set

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
	"method": "drc_stealth_state_set",
	"seq": 1
}
```

## 负载控制—相机光圈

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_aperture_value_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举 |
| aperture_value | 光圈值 | enum_int | {"0":"F_AUTO","50":"F0_5","70":"F0_7","80":"F0_8","90":"F0_9","95":"F0_95","100":"F1_0","110":"F1_1","120":"F1_2","140":"F1_4","160":"F1_6","170":"F1_7","180":"F1_8","200":"F2","220":"F2_2","240":"F2_4","250":"F2_5","280":"F2_8","320":"F3_2","330":"F3_3","340":"F3_4","350":"F3_5","400":"F4","440":"F4_4","450":"F4_5","480":"F4_8","500":"F5","560":"F5_6","630":"F6_3","670":"F6_7","680":"F6_8","710":"F7_1","800":"F8","900":"F9","950":"F9_5","960":"F9_6","1000":"F10","1100":"F11","1300":"F13","1400":"F14","1600":"F16","1800":"F18","1900":"F19","2000":"F20","2200":"F22","2500":"F25","2700":"F27","2900":"F29","3200":"F32","3600":"F36","3800":"F38","4000":"F40","4500":"F45","5100":"F51","5400":"F54","5700":"F57","6400":"F64","7200":"F72","7600":"F76","8000":"F80","9000":"F90","10700":"F107","12800":"F128","18000":"F180","25600":"F256"} | 根据不同机型，范围不一致 |

**Example:**

```
{
	"data": {
		"aperture_value": 5,
		"camera_type": "zoom",
		"payload_index": "39-0-7"
	},
	"method": "drc_camera_aperture_value_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_aperture_value_set

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
	"method": "drc_camera_aperture_value_set",
	"seq": 1
}
```

## 负载控制—相机快门

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_shutter_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举 |
| shutter_value | 快门设置 | enum_int | {"0":"1/8000 s","1":"1/6400 s","2":"1/6000 s","3":"1/5000 s","4":"1/4000 s","5":"1/3200 s","6":"1/3000 s","7":"1/2500 s","8":"1/2000 s","9":"1/1600 s","10":"1/1500 s","11":"1/1250 s","12":"1/1000 s","13":"1/800 s","14":"1/725 s","15":"1/640 s","16":"1/500 s","17":"1/400 s","18":"1/350 s","19":"1/320 s","20":"1/250 s","21":"1/240 s","22":"1/200 s","23":"1/180 s","24":"1/160 s","25":"1/125 s","26":"1/120 s","27":"1/100 s","28":"1/90 s","29":"1/80 s","30":"1/60 s","31":"1/50 s","32":"1/40 s","33":"1/30 s","34":"1/25 s","35":"1/20 s","36":"1/15 s","37":"1/12.5 s","38":"1/10 s","39":"1/8 s","40":"1/6.25 s","41":"1/5 s","42":"1/4 s","43":"1/3 s","44":"1/2.5 s","45":"1/2 s","46":"1/1.67 s","47":"1/1.25 s","48":"1.0 s","49":"1.3 s","50":"1.6 s","51":"2.0 s","52":"2.5 s","53":"3.0 s","54":"3.2 s","55":"4.0 s","56":"5.0 s","57":"6.0 s","58":"7.0 s","59":"8.0 s","60":"Auto"} | 根据不同机型范围不一样 |

**Example:**

```
{
	"data": {
		"shutter_value": 5,
		"camera_type": "zoom",
		"payload_index": "39-0-7"
	},
	"method": "drc_camera_shutter_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_shutter_set

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
	"method": "drc_camera_shutter_set",
	"seq": 1
}
```

## 负载控制—ISO设置

seq 是递增的序号，保证指令顺序执行，与 data 同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_iso_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角","zoom":"变焦"} | 相机类型枚举 |
| iso_value | ISO值 | enum_int | {"0":"ISO_AUTO","2":"ISO_50","3":"ISO_100","4":"ISO_200","5":"ISO_400","6":"ISO_800","7":"ISO_1600","8":"ISO_3200","9":"ISO_6400","10":"ISO_12800","11":"ISO_25600","12":"ISO_51200","13":"ISO_102400","255":"ISO_FIXED"} | 不同机型范围不一样 |

**Example:**

```
{
	"data": {
		"camera_type": "zoom",
		"iso_value": 5,
		"payload_index": "39-0-7"
	},
	"method": "drc_camera_iso_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_iso_set

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
	"method": "drc_camera_iso_set",
	"seq": 1
}
```

## 负载控制—机械快门

支持用户手动关闭机械快门，提高设备作业寿命，Matrice 3D 广角模式下机械快门开关（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_mechanical_shutter_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角"} | 相机类型枚举 |
| mechanical_shutter_state | 是否使能机械快门 | enum_int | {"0":"关闭","1":"开启"} | 开启还是关闭机械快门 |

**Example:**

```
{
	"data": {
		"camera_type": "wide",
		"mechanical_shutter_state": 1,
		"payload_index": "39-0-7"
	},
	"method": "drc_camera_mechanical_shutter_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_mechanical_shutter_set

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
	"method": "drc_camera_mechanical_shutter_set",
	"seq": 1
}
```

## 负载控制—镜头去畸变

能让用户的广角视角不再有暗角，Matrice 3D 广角模式的镜头去畸变（seq 是递增的序号，保证指令顺序执行，与 data 同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_dewarping_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text |  | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| camera_type | 相机类型 | enum_string | {"wide":"广角"} | 相机类型枚举 |
| dewarping_state | 是否使能去畸变 | enum_int | {"0":"关闭","1":"开启"} | 开启还是关闭畸变 |

**Example:**

```
{
	"data": {
		"camera_type": "wide",
		"dewarping_state": 1,
		"payload_index": "39-0-7"
	},
	"method": "drc_camera_dewarping_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_dewarping_set

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
	"method": "drc_camera_dewarping_set",
	"seq": 1
}
```
