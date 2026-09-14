---
title: "远程控制"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/rc-pro/remote-control.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 飞行器状态信息上报

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_drone_state_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| stealth_state | 隐蔽模式状态 | bool | {"0":"关闭","1":"开启"} |  |
| night_lights_state | 夜航灯状态 | bool | {"0":"关闭","1":"开启"} |  |
| mode_code | 飞行器状态 | enum_int | {"0":"待机","1":"起飞准备","2":"起飞准备完毕","3":"手动飞行","4":"自动起飞","5":"航线飞行","6":"全景拍照","7":"智能跟随","8":"ADS-B 躲避","9":"自动返航","10":"自动降落","11":"强制降落","12":"三桨叶降落","13":"升级中","14":"未连接","15":"APAS","16":"虚拟摇杆状态","17":"指令飞行"} |  |

**Example:**

```
{
	"data": {
		"mode_code": 0,
		"night_lights_state": 0,
		"stealth_state": 0
	},
	"method": "drc_drone_state_push",
	"seq": 1
}
```

## 摄像头osd 推送

用于推送摄像头参数信息（seq是递增的序号，保证指令顺序执行，与data同级）

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
| »wide_aperture_value | 光圈值 | enum_int | {"280":"F2.8","320":"F3.2","350":"F3.5","400":"F4","450":"F4.5","500":"F5","560":"F5.6","630":"F6.3","710":"F7.1","800":"F8","900":"F9","1000":"F10","1100":"F11"} |  |
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
| »zoom_aperture_value | 变焦光圈值 | enum_int | {"440":"F4.4"} |  |
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

## drc初始状态订阅

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_initial_state_subscribe

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| null | null | double |  |  |

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
