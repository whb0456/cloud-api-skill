---
title: "远程控制"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock3/remote-control.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## PSDK—浮窗推送

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_psdk_floating_window_text

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| floating_window_text | 浮窗内容 | text | {"length":""} |  |

**Example:**

```
{
	"data": {
		"floating_window_text": "",
		"psdk_index": 0
	},
	"method": "drc_psdk_floating_window_text",
	"seq": 1
}
```

## 喊话器—音频播放进度

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_play_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| result | 结果 | enum_int | {"0":"成功"} |  |
| status | 状态 | enum_string | {"failed":"失败","in_progress":"进度中","success":"成功"} |  |
| progress | 进度 | struct |  |  |
| »step_key | 步骤 | enum_string | {"change_work_mode":"工作","download":"下载","encoding":"转换","play":"播放","tts_processing":"tts播放","upload":"上传"} |  |
| »percent | 进度 | int | {"max":"100","min":"1"} |  |
| md5 | 验证 | string |  |  |

## PSDK—状态上报

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_psdk_state_info

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| psdk_type | psdk类型 | enum_int | {"4":"三方","5":"大疆自研"} |  |
| psdk_name | 名称 | enum_string | {"Searchlight":"探照灯","Speaker":"喊话器"} |  |
| psdk_sn | SN | text | {"length":""} |  |
| psdk_version | 版本 | text | {"length":""} |  |
| psdk_lib_version | lib版本 | text | {"length":""} |  |
| speaker | 喊话器 | struct |  |  |
| »work_mode | 工作模式 | int | {"0": "TTS模式", "1":"实时喊话","4": "边传边播", "5":"航线喊话"} |  |
| »play_mode | 播放模式 | enum_int | {"0":"单曲播放","1":"循环播放"} |  |
| »system_state | 喊话器状态 | enum_int | {"0":"空闲中","1":"传输中(机场到飞行器)","2":"播放中","3":"异常中","4":"TTS 文本转换中","99":"下载中(机场从云端下载)"} |  |
| »play_volume | 音量 | int | {"max":"100","min":"1"} |  |
| »play_file_name | 文件名称 | text | {"length":""} |  |
| »play_file_md5 | 文件验证 | text | {"length":""} |  |
| »tts_volume | TTS播放音量 | int | {"max":"100","min":"1"} |  |
| »tts_type | TTS播放类型 | enum_int | {"0":"男声","1":"女声"} |  |
| »tts_language | 语言 | enum_int | {"0":"中文","1":"英文"} |  |
| »tts_speed | 语速 | int | {"max":"100","min":"1"} |  |
| light | 探照灯 | struct |  |  |
| »work_mode | 工作模式 | int |  |  |
| »brightness | 亮度 | int |  |  |
| »calibration_status | 校准 | enum_int | {"0":"校准完成","1":"正在校准","2":"校准失败"} |  |
| »calibration_progress | 校准进度 | int |  |  |
| »left_value | 左灯微调值 | int | {"max":"+3°","min":-3"} |  |
| »right_value | 右灯微调值 | int | {"max":"+3°","min":-3"} |  |
| »wide_field_mode | 探照灯广视野模式是否开启 | bool | {"false":"关闭","true":"开启"} |  |
| »light_gimbal_control | 探照灯云台联动是否开启 | bool | {"false":"关闭","true":"开启"} |  |
| values | 自定义值空间位置 | struct |  |  |
| »index | index | int |  |  |
| »value | value | int |  |  |

## PSDK—UI资源包上传

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_psdk_ui_resource

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| psdk_ready | 是否准备就绪 | enum_int | {"0":"未就绪","1":"就绪"} |  |
| object_key | oss 对象 | text | {"length":""} |  |

**Example:**

```
{
	"data": {
		"object_key": "b4cfaae6-bd9d-4cd0-8472-63b608c3c581/SN/psdk_config/0/2023_6_7_1103_XXXXXX.tar.gz",
		"psdk_index": 0,
		"psdk_ready": 1
	},
	"method": "drc_psdk_ui_resource",
	"seq": 1
}
```

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
| »photo_format | 照片格式 | enum_int | {"7":"RJPEG","16":"DLT664"} |  |
| »record_time | 视频录制时长 | int | {"max":"","min":"","step":"","unit_name":"秒 / s"} |  |
| »recording_state | 录像状态 | enum_int | {"0":"空闲","1":"录像中"} |  |
| »photo_state | 拍照状态 | enum_int | {"0":"空闲","1":"拍照中"} |  |
| »remain_photo_num | 剩余拍照张数 | int |  |  |
| »remain_record_duration | 剩余录像时间 | int | {"max":"","min":"","step":"","unit_name":"秒 / s"} |  |
| »night_mode_settings | 夜景模式设置 | struct |  |  |
| »»night_mode | 夜景模式状态 | enum_int | {"0":"关闭","1":"开启","2":"自动"} | 自动模式根据环境光线自动切换 |
| »»denoise_level | 降噪等级 | enum_int | {"0":"关闭","1":"标准降噪","2":"增强降噪","3":"超强降噪"} | 增强降噪会影响帧率 |
| »»night_vision_enable | 黑白夜视使能 | bool | {"false":"关闭","true":"开启"} | 仅变焦7x以上生效 |
| »»infrared_fill_light_enable | 近红外补光使能 | bool | {"false":"关闭","true":"开启"} | 仅变焦7x以上生效 |
| »»night_scene_mode_suggestion | 夜景场景建议 | enum_int | {"0":"无建议","1":"建议开启夜景模式"} | 根据环境光线给出的建议 |
| »»is_working | 是否生效中 | enum_int | {"0":"未生效","1":"生效中"} | 实际工作状态 |
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
			"video_resolution": 0,
            "night_mode_settings": {
                "night_mode": 0,
                "denoise_level": 1,
                "night_vision_enable": true,
                "infrared_fill_light_enable": true,
                "night_scene_mode_suggestion": 1,
                "is_working": 1
              }
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

## 摄像头osd 推送

用于推送摄像头参数信息（seq是递增的序号，保证指令顺序执行，与data同级）

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_osd_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

## AI状态上报

用于推送AI目标识别功能相关信息（seq是递增的序号，保证指令顺序执行，与data同级）

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_info_push

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| identify_on | 识别开关 | enum_int | {"0":"关闭","1":"开启"} | 是否开启目标识别功能。 |
| spotlight_zoom_on | 跟随开关 | enum_int | {"0":"关闭","1":"开启"} | 是否启用 AI 跟随功能 |
| ai_spotlight_zoom | AI跟随状态 | struct |  | AI 跟随状态与原因信息。 |
| »state | 跟随状态 | enum_int | {"0":"空闲","1":"等待选择","2":"等待确认","3":"跟随中"} | 当前 AI 跟随状态。 |
| »state_reason | 状态原因 | enum_int | {"0":"正常","1":"距离目标过近","2":"距离目标过远","3":"到达限低","4":"到达限高","5":"到达限远","6":"接近限飞区","7":"云台到达限位","8":"飞机偏航达到环绕模式最大限制","9":"障碍物距离过近","10":"定位源切换(GPS→RTK)","11":"定位源切换(RTK→GPS)","12":"避障失效","13":"到达变焦范围限制","14":"跟踪目标丢失","15":"GPS信号弱",；**注意：以下状态原因，会退出AI跟随**；160":"正常退出","161":"未适配负载","162":"不支持相机模式","163":"非法命令","164":"定位失败","165":"飞机未起飞","166":"飞行模式错误","167":"当前模式不可用(返航/降落/姿态)","168":"丢失遥控/图传信号"} | 当前状态或退出原因说明。 |
| ai_model_list | 模型列表 | array | {"item_type":"struct"} | 设备中可用的 AI 模型列表。 |
| »index | 模型编号 | int | {"min":0} |  |
| »signed_name | 模型名称 | text | {"length":""} | 模型签名名称。 |
| selected_ai_model | 当前选中模型 | struct |  | 当前被选中的 AI 模型信息。 |
| »index | 模型编号 | int | {"min":0} | 当前选中的模型编号。 |
| »score | 置信度 | int | {"max":"100","min":"0","step":"1"} | 当前识别结果的置信度。 |
| »score_mode | 置信度模式 | enum_int | {"0":"无效值","1":"计数模式","2":"搜救模式","3":"用户自定义模式"} |  |
| »image_source | 图像源 | enum_list | {"1":"广角","2":"变焦","3":"红外","7":"可见光"} | 模型支持的码流。 |
| »digital_effect | 调色模式 | enum_list | {"0":"白热","1":"黑热","2":"红热"} | 模型支持的红外调色板类型。 |
| »filters | 过滤器 | array | {"size": -, "item_type": int} | 当前目标过滤列表。三方模型filters 数值需使用对应的 label index 加 128 偏移后生成。例如：label index 为 1 则 filters 值为 129。 |
| »labels | 识别标签 | array | {"item_type":"struct"} | 模型支持识别的标签集合。 |
| »»index | 标签ID | int | {"min":0} | 标签唯一标识符。 |
| »»name | 标签名称 | text | {"length":""} |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_info_push",
  "data": {
    "identify_on": 1,
    "spotlight_zoom_on": 1,
    "ai_spotlight_zoom": {
      "state": 0,
      "state_reason": 0
    },
    "ai_model_list": [
      {
        "index": 0,
        "signed_name": "DJI"
      },
      {
        "index": 128,
        "signed_name": "高速公路场景识别"
      }
    ],
    "selected_ai_model": {
      "index": 0,
      "score": 100,
      "score_mode": 1,
      "image_source": [1, 2, 3],
      "digital_effect": [0, 1, 2],
      "filters": [1, 2, 3],
      "labels": [
        {
          "index": 0,
          "name": "摩托车"
        },
        {
          "index": 1,
          "name": "自行车"
        }
      ]
    },
    "ai_wayline_state": {
      "sequence_shot": true,
      "wait_control": true,
      "record": true,
      "normal_shot": true,
      "count_down_time": 23,
      "alert_uuid": "xxxxxxxxxxxxxxx"
    }
  }
}
```

# Service

## 夜景模式设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_night_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](；建议使用M4D（98-0-0）和M4TD（99-0-0）） |
| mode | 夜景模式 | enum_int | {"0":"关闭","1":"开启","2":"自动"} | 自动模式根据进光量自动开启 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_night_mode_set",
    "data": {
        "payload_index": "99-0-0",
        "mode": 0
    }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_night_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非0代表错误 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_night_mode_set",
    "data": {
        "result": 0
    }
}
```

## 降噪等级设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_denoise_level_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](；建议使用M4D（98-0-0）和M4TD（99-0-0）） |
| level | 降噪等级 | enum_int | {"2":"增强降噪 15fps","3":"超强降噪 5fps"} | 仅手动开启夜景模式后生效 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_denoise_level_set",
    "data": {
        "payload_index": "99-0-0",
        "level": 2
    }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_denoise_level_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非0代表错误 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_denoise_level_set",
    "data": {
        "result": 0
    }
}
```

## 黑白夜视使能

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_night_vision_enable

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](；建议使用M4TD（99-0-0）） |
| enable | 使能状态 | bool | {"false":"关闭","true":"开启"} | 仅变焦7x以上生效 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_night_vision_enable",
    "data": {
        "payload_index": "99-0-0",
        "enable": true
    }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_night_vision_enable

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非0代表错误 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_camera_night_vision_enable",
    "data": {
        "result": 0
    }
}
```

## 近红外补光使能

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_infrared_fill_light_enable

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](；建议使用M4TD（99-0-0） |
| enable | 使能状态 | bool | {"false":"关闭","true":"开启"} | 仅变焦7x以上生效 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_infrared_fill_light_enable",
    "data": {
        "payload_index": "99-0-0",
        "enable": true
    }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_infrared_fill_light_enable

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非0代表错误 |

**Example:**

```
{
    "seq": 1,
    "method": "drc_infrared_fill_light_enable",
    "data": {
        "result": 0
    }
}
```

## 强制降落

调用后，无论是否有障碍飞行器都会直接降到地面，用 drone_emergency_stop 命令可取消。降落完成后只能人工拾取飞行器，慎用!（seq 是递增的序号，保证指令顺序执行，与 data 同级）

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

调用后，飞行器会开始降落，在开启避障时可能会因触发避障而中止。用 drone_emergency_stop 命令可取消。降落完成后只能人工拾取飞行器，慎用！（seq 是递增的序号，保证指令顺序执行，与 data 同级）

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

## 探照灯—亮度设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_light_brightness_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| group | 类型 | enum_int | {"0":"主探照灯"} |  |
| brightness | 亮度 | int | {"max":100","min":"1"} | 亮度值 |

**Example:**

```
{
	"data": {
		"brightness": 1,
		"group": 0,
		"psdk_index": 1
	},
	"method": "drc_light_brightness_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_light_brightness_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_light_brightness_set",
	"seq": 1
}
```

## 探照灯—模式设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_light_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| group | 类型 | enum_int | {"0":"主探照灯"} |  |
| mode | 模式 | enum_int | { "0": "关闭", "1": "常亮", "2": "爆闪", "3": "快速爆闪", "4": "交替爆闪" } |  |

**Example:**

```
{
	"data": {
		"group": 0,
		"mode": 1,
		"psdk_index": 1
	},
	"method": "drc_light_mode_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_light_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_light_mode_set",
	"seq": 1
}
```

## 探照灯—左右角度微调

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_light_fine_tuning_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| position | 灯 | enum_int | {"0":"左灯","1":"右灯"} |  |
| value | 值 | int | {"max":"+3°","min":-3"} |  |
| saved | 是否保存 | bool | {"0":"否","1":"是"} |  |

**Example:**

```
{
	"data": {
		"position": 0,
		"psdk_index": 1,
		"saved": false,
		"value": 1
	},
	"method": "drc_light_fine_tuning_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_light_fine_tuning_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_light_fine_tuning_set",
	"seq": 1
}
```

## 探照灯—云台校准

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_light_calibration

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |

**Example:**

```
{
	"data": {
		"psdk_index": 1
	},
	"method": "drc_light_calibration",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_light_calibration

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_light_calibration",
	"seq": 1
}
```

## 喊话器—模式设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_play_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| play_mode | 喊话器播放模式 | enum_int | {"0":"单次播放","1":"循环播放(单曲)"} |  |

**Example:**

```
{
	"data": {
		"play_mode": 1,
		"psdk_index": 1
	},
	"method": "drc_speaker_play_mode_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_play_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_speaker_play_mode_set",
	"seq": 1
}
```

## 喊话器—TTS喊话设置

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_tts_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 根据设备推上来 |  |
| volume | 音量 | int | {"max":"100","min"0:"","step":"","unit_name":null} |  |
| type | 类型 | enum_int | {"0":"男声","1":"女声"} |  |
| language | 语言 | enum_int | {"0":"中文","1":"英文"} |  |
| speed | 语速 | int | {"max"100:"","min":"0","step":"","unit_name":null} |  |

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_tts_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_speaker_tts_set",
	"seq": 1
}
```

## 喊话器—设置音量

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_play_volume_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |
| play_volume | 喊话器音量 | int | {"max":"100","min":"1"} |  |

**Example:**

```
{
	"data": {
		"play_volume": 60,
		"psdk_index": 1
	},
	"method": "drc_speaker_play_volume_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_play_volume_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_speaker_play_volume_set",
	"seq": 1
}
```

## 喊话器—停止播放

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_play_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |

**Example:**

```
{
	"data": {
		"psdk_index": 2
	},
	"method": "drc_speaker_play_stop",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_play_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 结果返回码 | int |  |  |

**Example:**

```
{
	"data": {
		"result": 0
	},
	"method": "drc_speaker_play_stop",
	"seq": 1
}
```

## 喊话器—重新播放

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_replay

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送 |  |

**Example:**

```
{
	"data": {
		"psdk_index": 2
	},
	"method": "drc_speaker_replay",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_replay

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
	"method": "drc_speaker_replay",
	"seq": 1
}
```

## 喊话器—播放TTS文本

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_speaker_tts_play_start

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送设置 |  |
| tts | TTS文本 | struct |  |  |
| »name | 文件名 | text | {"length":""} |  |
| »text | 文本内容 | text | {"length":""} |  |
| »md5 | 文件内容的md5校验和, 用作机场唯一标识 | text | {"length":""} |  |

**Example:**

```
{
	"data": {
		"psdk_index": 2,
		"tts": {
			"md5": "ACDEFQD33D31C212",
			"name": "",
			"text": ""
		}
	},
	"method": "drc_speaker_tts_play_start",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_speaker_tts_play_start

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
	"method": "drc_speaker_tts_play_start",
	"seq": 1
}
```

## PSDK-发送文本框内容

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_psdk_input_box_text_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int |  |  |
| value | 文本内容 | text | {"length":"128"} |  |

**Example:**

```
{
	"data": {
		"psdk_index": 1,
		"value": ""
	},
	"method": "drc_psdk_input_box_text_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_psdk_input_box_text_set

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
	"method": "drc_psdk_input_box_text_set",
	"seq": 1
}
```

## PSDK-设置控件值

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_psdk_widget_value_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| psdk_index | psdk 负载设备索引 | int | 依据设备推送设置 |  |
| index | 控件编号 | int |  |  |
| value | 控件值 | int |  | 开关、进度等控件值由开发者自行定义 |

**Example:**

```
{
	"data": {
		"index": 1,
		"psdk_index": 1,
		"value": 60
	},
	"method": "drc_psdk_widget_value_set",
	"seq": 1
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_psdk_widget_value_set

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
	"method": "drc_psdk_widget_value_set",
	"seq": 1
}
```

## DRC初始状态订阅

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

## 夜航灯设置

seq是递增的序号，保证指令顺序执行，与data同级

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

设置飞机的隐蔽模式，用于关闭所有飞机灯光（seq是递增的序号，保证指令顺序执行，与data同级）

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

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_aperture_value_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_shutter_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

seq是递增的序号，保证指令顺序执行，与data同级

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_iso_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

支持用户手动关闭机械快门，提高设备作业寿命，Matrice 3D广角模式下机械快门开关 （seq是递增的序号，保证指令顺序执行，与data同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_mechanical_shutter_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

能让用户的广角视角不再有暗角，Matrice 3D广角模式的镜头去畸变（seq是递增的序号，保证指令顺序执行，与data同级）

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_dewarping_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
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

## 红外照片格式设置

用于设置红外照片格式，需要直播镜头先切换为红外才可有效使用

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_camera_photo_format_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| payload_index | 相机枚举 | text | {"length":""} | 相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| photo_format | 照片格式 | enum_int | {"7":"RJPEG","16":"DLT664"} | 照片格式类型枚举 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_camera_photo_format_set",
  "data": {
    "payload_index": "81-0-0",
    "photo_format": 16
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_camera_photo_format_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_camera_photo_format_set",
  "data": {
    "result": 0
  }
}
```

## AI模型选择

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_model_select

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| index | 模型索引 | int | 依据drc_ai_info_push推送 |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_model_select",
  "data": {
    "index": 0
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_model_select

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
  "method": "drc_ai_model_select",
  "seq": 1
}
```

## AI识别开关设置

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_identify_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| on | AI识别开关 | enum_int | {"0":"关闭","1":"开启"} |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_set",
  "data": {
    "on": 1
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_identify_set

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
  "method": "drc_ai_identify_set",
  "seq": 1
}
```

## AI跟随开关设置

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_spotlight_zoom_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| on | AI跟随开关 | enum_int | {"0":"关闭","1":"开启"} |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_set",
  "data": {
    "on": 1
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_spotlight_zoom_set

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
  "method": "drc_ai_spotlight_zoom_set",
  "seq": 1
}
```

## AI识别目标跟随

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_spotlight_zoom_track

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| target_index | 目标index | int |  | 依据直播流推送 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_track",
  "data": {
    "target_index": 0
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_spotlight_zoom_track

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
  "method": "drc_ai_spotlight_zoom_track",
  "seq": 1
}
```

## AI框选目标跟随

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_spotlight_zoom_select

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| center_x | 框的中心点x坐标 | double | {"max":1,"min":0}*10000 | 框中心的X坐标，单位：1/10000*画面宽度 |
| center_y | 框的中心点y坐标 | double | {"max":1,"min":0}*10000 | 框中心的Y坐标，单位：1/10000*画面高度 |
| height | 框的高度 | double | {"max":1,"min":0}*10000 | 框宽度，单位：1/10000*画面宽度 |
| width | 框的宽度 | double | {"max":1,"min":0}*10000 | 框高度，单位：1/10000*画面高度 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_select",
  "data": {
    "center_x":0.0*10000,
    "center_y":0.0*10000,
    "height":1.0*10000,
    "width":1.0*10000
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_spotlight_zoom_select

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
  "method": "drc_ai_spotlight_zoom_select",
  "seq": 1
}
```

## AI框选目标跟随确认

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_spotlight_zoom_confirm

**Data:** null

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_confirm",
  "data": {
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_spotlight_zoom_confirm

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_confirm",
  "data": {
    "result": 0
  }
}
```

## 停止目标跟随

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_spotlight_zoom_stop

**Data:** null

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_stop",
  "data": {
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_spotlight_zoom_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_spotlight_zoom_stop",
  "data": {
    "result": 0
  }
}
```

## 设置AI识别置信度模式

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_identify_score_mode_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| score_mode | AI识别置信度模式 | enum_int | {"0":"无效值","1":"计数模式","2":"搜救模式","3":"用户自定义模式"} |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_score_mode_set",
  "data": {
    "score_mode": 1
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_identify_score_mode_set

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
  "method": "drc_ai_identify_score_mode_set",
  "seq": 1
}
```

## 设置AI识别置信度

置信度模式为用户自定义模式时可自由设置置信度分数

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_identify_score_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| score | AI识别置信度分数 | int | {"max":"100","min":"0","step":"1"} |  |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_score_set",
  "data": {
    "score": 100
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_identify_score_set

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
  "method": "drc_ai_identify_score_set",
  "seq": 1
}
```

## 重置AI识别置信度

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_identify_score_reset

**Data:** null

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_score_reset",
  "data": {
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_identify_score_reset

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_score_reset",
  "data": {
    "result": 0
  }
}
```

## 设置AI识别目标过滤列表

**Topic:** thing/product/{gateway_sn}/drc/down

**Direction:** down

**Method:** drc_ai_identify_filter_set

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| filters | AI识别目标过滤列表 | array | {"size": -, "item_type": int} | 三方模型filters 数值需使用对应的 label index 加 128 偏移后生成。例如：label index 为 1 则 filters 值为 129。 |

**Example:**

```
{
  "seq": 1,
  "method": "drc_ai_identify_filter_set",
  "data": {
    "filters": [1, 2, 3]
  }
}
```

**Topic:** thing/product/{gateway_sn}/drc/up

**Direction:** up

**Method:** drc_ai_identify_filter_set

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
  "method": "drc_ai_identify_filter_set",
  "seq": 1
}
```
