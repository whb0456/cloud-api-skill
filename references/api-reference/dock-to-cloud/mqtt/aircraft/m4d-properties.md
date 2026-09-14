---
title: "M4D/M4TD 设备属性"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/aircraft/m4d-properties.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

### 设备属性列表

- pushMode：

  - 0：设备推送定频数据，设备将以 0.5HZ 的频率定时上报 (Topic:thing/product/{device_sn}/osd)
  - 1：设备推送状态数据，设备在状态变化时上报（Topic:thing/product/{device_sn}/state）
- accessMode：

  - r：属性只读
  - rw：属性可读写 (Topic:thing/product/{gateway_sn}/property/set)

| Column | Name | Type | constraint | Description | accessMode | pushMode |
| --- | --- | --- | --- | --- | --- | --- |
| best_link_gateway | 飞行器图传连接质量最好的网关SN | text |  | 蛙跳任务场景下，当飞行器对频了两个机场后，推送连接最好的机场SN | r | 1 |
| wireless_link_topo | 图传连接拓扑 | struct |  |  | r | 1 |
| »secret_code | 加密编码 | array | {"size": 28, "item_type": int} |  |  | 0 |
| »center_node | 飞行器对频信息 | struct |  |  |  | 0 |
| »»sdr_id | 扰码信息 | int |  |  |  | 0 |
| »»sn | 设备sn | text |  |  |  | 0 |
| »leaf_nodes | 当前连接的机场或遥控器对频信息 | array | {"size": -, "item_type": struct} |  |  | 0 |
| »»sdr_id | 扰码信息 | int |  |  |  | 0 |
| »»sn | 设备sn | text |  |  |  | 0 |
| »»control_source_index | 控制源序号 | int | {"max":"2","min":"1","step":"1","unit_name":"无 / "} |  |  | 0 |
| cameras | 飞行器相机信息 | array | {"size": -, "item_type": struct} |  | r | 0 |
| »remain_photo_num | 剩余拍照张数 | int |  | 剩余拍照张数 |  | 0 |
| »remain_record_duration | 剩余录像时间 | int | {"unit_name":"秒 / s"} | 剩余录像时间 |  | 0 |
| »record_time | 视频录制时长 | int | {"unit_name":"秒 / s"} | 视频录制时长 |  | 0 |
| »payload_index | 负载编号 | text |  | 负载编号，相机枚举值。非标准的 device_mode_key，格式为 {type-subtype-gimbalindex}，可以参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |  | 0 |
| »camera_mode | 相机模式 | enum_int | {"0":"拍照","1":"录像","2":"智能低光","3":"全景拍照"} | 相机模式 |  | 0 |
| »photo_state | 拍照状态 | enum_int | {"0":"空闲","1":"拍照中"} | 拍照状态 |  | 0 |
| »screen_split_enable | 分屏是否使能 | bool | {"0":"分屏使能关闭","1":"分屏使能开启"} |  |  | 0 |
| »recording_state | 录像状态 | enum_int | {"0":"空闲","1":"录像中"} | 录像状态 |  | 0 |
| »zoom_factor | 变焦倍数 | float |  |  |  | 0 |
| »ir_zoom_factor | 红外变焦倍数 | float |  | 红外变焦倍数 |  | 0 |
| »liveview_world_region | 视场角（FOV）在 liveview 中的区域 | struct |  | 变焦相机的视场角相对于广角相机或者红外相机的视场角，在 liveview 中会有所不同。坐标原点为镜头左上角。 |  | 0 |
| »»left | 左上角的 x 轴起始点 | float |  | 左上角的 x 轴起始点 | r | 0 |
| »»top | 左上角的 y 轴起始点 | float |  | 左上角的 y 轴起始点 | r | 0 |
| »»right | 右下角的 x 轴起始点 | float |  | 右下角的 x 轴起始点 | r | 0 |
| »»bottom | 右下角的 y 轴起始点 | float |  | 右下角的 y 轴起始点 | r | 0 |
| »photo_storage_settings | 照片存储设置集合 | array | {"size": -, "item_type": enum_string} | 取值范围{current, vision, ir} |  | 0 |
| »video_storage_settings | 视频存储设置集合 | array | {"size": -, "item_type": enum_string} | 取值范围{current, vision, ir} |  | 0 |
| »wide_exposure_mode | 广角镜头曝光模式 | enum_int | {"1":"自动","2":"快门优先曝光","3":"光圈优先曝光","4":"手动曝光"} | 当前配置的广角镜头曝光模式 |  | 0 |
| »wide_iso | 广角镜头感光度 | enum_int | {"0":"Auto","1":"Auto(High Sense)","2":"50","3":"100","4":"200","5":"400","6":"800","7":"1600","8":"3200","9":"6400","10":"12800","11":"25600","255":"FIXED"} | 当前配置的广角镜头感光度 |  | 0 |
| »wide_shutter_speed | 广角镜头快门速度 | enum_int | {"0":"1/8000 s","1":"1/6400 s","2":"1/6000 s","3":"1/5000 s","4":"1/4000 s","5":"1/3200 s","6":"1/3000 s","7":"1/2500 s","8":"1/2000 s","9":"1/1600 s","10":"1/1500 s","11":"1/1250 s","12":"1/1000 s","13":"1/800 s","14":"1/725 s","15":"1/640 s","16":"1/500 s","17":"1/400 s","18":"1/350 s","19":"1/320 s","20":"1/250 s","21":"1/240 s","22":"1/200 s","23":"1/180 s","24":"1/160 s","25":"1/125 s","26":"1/120 s","27":"1/100 s","28":"1/90 s","29":"1/80 s","30":"1/60 s","31":"1/50 s","32":"1/40 s","33":"1/30 s","34":"1/25 s","35":"1/20 s","36":"1/15 s","37":"1/12.5 s","38":"1/10 s","39":"1/8 s","40":"1/6.25 s","41":"1/5 s","42":"1/4 s","43":"1/3 s","44":"1/2.5 s","45":"1/2 s","46":"1/1.67 s","47":"1/1.25 s","48":"1.0 s","49":"1.3 s","50":"1.6 s","51":"2.0 s","52":"2.5 s","53":"3.0 s","54":"3.2 s","55":"4.0 s","56":"5.0 s","57":"6.0 s","58":"7.0 s","59":"8.0 s","65534":"Auto"} | 当前配置的广角镜头快门速度 |  | 0 |
| »wide_exposure_value | 广角镜头曝光值 | enum_int | {"1":"-5.0EV","2":"-4.7EV","3":"-4.3EV","4":"-4.0EV","5":"-3.7EV","6":"-3.3EV","7":"-3.0EV","8":"-2.7EV","9":"-2.3EV","10":"-2.0EV","11":"-1.7EV","12":"-1.3EV","13":"-1.0EV","14":"-0.7EV","15":"-0.3EV","16":"0EV","17":"0.3EV","18":"0.7EV","19":"1.0EV","20":"1.3EV","21":"1.7EV","22":"2.0EV","23":"2.3EV","24":"2.7EV","25":"3.0EV","26":"3.3EV","27":"3.7EV","28":"4.0EV","29":"4.3EV","30":"4.7EV","31":"5.0EV","255":"FIXED"} | 当前配置的广角镜头曝光值 |  | 0 |
| »zoom_exposure_mode | 变焦镜头曝光模式 | enum_int | {"1":"自动","2":"快门优先曝光","3":"光圈优先曝光","4":"手动曝光"} | 当前配置的变焦镜头曝光模式 |  | 0 |
| »zoom_iso | 变焦镜头感光度 | enum_int | {"0":"Auto","1":"Auto(High Sense)","2":"50","3":"100","4":"200","5":"400","6":"800","7":"1600","8":"3200","9":"6400","10":"12800","11":"25600","255":"FIXED"} | 当前配置的变焦镜头感光度 |  | 0 |
| »zoom_shutter_speed | 变焦镜头快门速度 | enum_int | {"0":"1/8000 s","1":"1/6400 s","2":"1/6000 s","3":"1/5000 s","4":"1/4000 s","5":"1/3200 s","6":"1/3000 s","7":"1/2500 s","8":"1/2000 s","9":"1/1600 s","10":"1/1500 s","11":"1/1250 s","12":"1/1000 s","13":"1/800 s","14":"1/725 s","15":"1/640 s","16":"1/500 s","17":"1/400 s","18":"1/350 s","19":"1/320 s","20":"1/250 s","21":"1/240 s","22":"1/200 s","23":"1/180 s","24":"1/160 s","25":"1/125 s","26":"1/120 s","27":"1/100 s","28":"1/90 s","29":"1/80 s","30":"1/60 s","31":"1/50 s","32":"1/40 s","33":"1/30 s","34":"1/25 s","35":"1/20 s","36":"1/15 s","37":"1/12.5 s","38":"1/10 s","39":"1/8 s","40":"1/6.25 s","41":"1/5 s","42":"1/4 s","43":"1/3 s","44":"1/2.5 s","45":"1/2 s","46":"1/1.67 s","47":"1/1.25 s","48":"1.0 s","49":"1.3 s","50":"1.6 s","51":"2.0 s","52":"2.5 s","53":"3.0 s","54":"3.2 s","55":"4.0 s","56":"5.0 s","57":"6.0 s","58":"7.0 s","59":"8.0 s","65534":"Auto"} | 当前配置的变焦镜头快门速度 |  | 0 |
| »zoom_exposure_value | 变焦镜头曝光值 | enum_int | {"1":"-5.0EV","2":"-4.7EV","3":"-4.3EV","4":"-4.0EV","5":"-3.7EV","6":"-3.3EV","7":"-3.0EV","8":"-2.7EV","9":"-2.3EV","10":"-2.0EV","11":"-1.7EV","12":"-1.3EV","13":"-1.0EV","14":"-0.7EV","15":"-0.3EV","16":"0EV","17":"0.3EV","18":"0.7EV","19":"1.0EV","20":"1.3EV","21":"1.7EV","22":"2.0EV","23":"2.3EV","24":"2.7EV","25":"3.0EV","26":"3.3EV","27":"3.7EV","28":"4.0EV","29":"4.3EV","30":"4.7EV","31":"5.0EV","255":"FIXED"} | 当前配置的变焦镜头曝光值 |  | 0 |
| »zoom_focus_mode | 变焦镜头对焦模式 | enum_int | {"0":"MF","1":"AFS","2":"AFC"} |  |  | 0 |
| »zoom_focus_value | 变焦镜头对焦值 | int |  |  |  | 0 |
| »zoom_max_focus_value | 变焦镜头最大对焦值 | int |  |  |  | 0 |
| »zoom_min_focus_value | 变焦镜头最小对焦值 | int |  |  |  | 0 |
| »zoom_calibrate_farthest_focus_value | 变焦镜头标定的最远对焦值 | int |  | 最清晰的最远位置对焦值 |  | 0 |
| »zoom_calibrate_nearest_focus_value | 变焦镜头标定的最近对焦值 | int |  | 最清晰的最近位置对焦值 |  | 0 |
| »zoom_focus_state | 变焦镜头对焦状态 | enum_int | {"0":"空闲","1":"对焦中","2":"对焦成功","3":"对焦失败"} |  |  | 0 |
| »ir_metering_mode | 红外测温模式 | enum_int | {"0":"关闭测温","1":"点测温","2":"区域测温"} |  |  | 0 |
| »ir_metering_point | 红外测温点 | struct |  | 红外测温点相关信息 |  | 0 |
| »»x | 测温点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x | r | 0 |
| »»y | 测温点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y | r | 0 |
| »»temperature | 测温点的温度 | double |  |  | r | 0 |
| »ir_metering_area | 红外测温区域 | struct |  | 红外测温区域相关信息 |  | 0 |
| »»x | 测温区域左上角点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x | r | 0 |
| »»y | 测温区域左上角点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y | r | 0 |
| »»width | 测温区域宽度 | double | {"max":1,"min":0} | 测温区域宽度 | r | 0 |
| »»height | 测温区域高度 | double | {"max":1,"min":0} | 测温区域高度 | r | 0 |
| »»aver_temperature | 测温区域平均温度 | double |  | 测温区域平均温度 | r | 0 |
| »»min_temperature_point | 测温区域最低温度点 | struct |  | 测温区域最低温度点相关信息 | r | 0 |
| »»»x | 最低温度点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x | r | 0 |
| »»»y | 最低温度点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y | r | 0 |
| »»»temperature | 最低温度点的温度 | double |  | 最低温度点的温度 | r | 0 |
| »»max_temperature_point | 测温区域最高温度点 | struct |  | 测温区域最高温度点相关信息 | r | 0 |
| »»»x | 最高温度点坐标 x | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，水平方向为 x | r | 0 |
| »»»y | 最高温度点坐标 y | double | {"max":1,"min":0} | 以镜头的左上角为坐标中心点，竖直方向为 y | r | 0 |
| »»»temperature | 最高温度点的温度 | double |  | 最高温度点的温度 | r | 0 |
| flysafe_database_version | 飞行安全数据库版本 | text | {"length":"64"} |  | r | 1 |
| offline_map_enable | 离线地图开关 | bool | {"0":"关闭","1":"开启"} | 当离线地图关闭后，离线地图同步不再进行自动同步 | r | 1 |
| dongle_infos | 4G Dongle信息 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »imei | dongle imei | text |  | Dongle 的唯一识别标志 | r | 0 |
| »dongle_type | Dongle 类型 | enum_int | {"6":"旧 Dongle","10":"支持 eSIM 的新 Dongle"} | Dongle 类型 | r | 0 |
| »eid | dongle eid | text |  | eSIM 的唯一识别标志，用于公众号查询套餐、购买服务 | r | 0 |
| »esim_activate_state | eSIM 激活状态 | enum_int | {"0":"未知","1":"未激活","2":"已激活"} | 需要激活才能使用 | r | 0 |
| »sim_card_state | SIM 卡状态 | enum_int | {"0":"未插入","1":"已插入"} | Dongle 中实体 SIM 卡的插入状态 | r | 0 |
| »sim_slot | SIM 卡槽使能状态 | enum_int | {"0":"未知","1":"实体 SIM 卡","2":"eSIM"} | 标识 Dongle 当前正在使用的 SIM 卡槽 | r | 0 |
| »esim_infos | eSIM 信息 | array | {"size": -, "item_type": struct} |  | r | 0 |
| »»telecom_operator | 支持的运营商 | enum_int | {"0":"未知","1":"移动","2":"联通","3":"电信"} | eSIM 支持的运营商 | r | 0 |
| »»enabled | eSIM 使能状态 | bool | {"false":"未使用","true":"使用中"} | 同时刻只能有一个 eSIM 是使能的 | r | 0 |
| »»iccid | sim iccid | text |  | SIM 卡的唯一识别标志，可以用于实体 SIM 卡的套餐购买 | r | 0 |
| »sim_info | SIM 卡信息 | struct |  | 可插入 Dongle 的实体 SIM 卡信息 | r | 0 |
| »»telecom_operator | 支持的运营商 | enum_int | {"0":"未知","1":"移动","2":"联通","3":"电信"} | SIM 卡支持的运营商 | r | 0 |
| »»sim_type | SIM 卡类型 | enum_int | {"0":"未知","1":"其他普通 SIM 卡","2":"三网卡"} | 实体 SIM 卡的类型 | r | 0 |
| »»iccid | sim iccid | text |  | SIM 卡的唯一识别标志，可以用于实体 SIM 卡的套餐购买 | r | 0 |
| current_rth_mode | 返航高度模式当前值 | enum_int | {"0":"智能高度","1":"设定高度"} | 大疆机场当前实际使用的返航高度模式 | r | 1 |
| rth_mode | 返航高度模式设置值 | enum_int | {"0":"智能高度","1":"设定高度"} | 智能返航模式下，飞行器将自动规划最佳返航高度。大疆机场当前不支持设置返航高度模式，只能选择'设定高度'模式。当环境，光线不满足视觉系统要求时（譬如傍晚阳光直射、夜间弱光无光），飞行器将使用您设定的返航高度进行直线返航 | r | 1 |
| obstacle_avoidance | 飞行器避障状态 | struct |  |  | rw | 0 |
| »horizon | 水平避障状态 | enum_int | {"0":"关闭","1":"开启"} |  |  | 0 |
| »upside | 上视避障状态 | enum_int | {"0":"关闭","1":"开启"} |  |  | 0 |
| »downside | 下视避障状态 | enum_int | {"0":"关闭","1":"开启"} |  |  | 0 |
| is_near_area_limit | 是否接近限飞区 | enum_int | {"0":"未达到限飞区","1":"接近限飞区"} |  | r | 0 |
| is_near_height_limit | 是否接近设定的限制高度 | enum_int | {"0":"未达到设定的限制高度","1":"接近设定的限制高度"} |  | r | 0 |
| height_limit | 飞行器限高 | int | {"max":"1500","min":"20","step":"1","unit_name":"米 / m"} |  | rw | 0 |
| night_lights_state | 飞行器夜航灯状态 | enum_int | {"0":"关闭","1":"打开"} |  | rw | 0 |
| activation_time | 飞行器激活时间(unix 时间戳) | int | {"unit_name":"秒 / s"} |  | r | 0 |
| maintain_status | 保养信息 | struct |  |  | r | 0 |
| »maintain_status_array | 保养信息数组 | array | {"size": -, "item_type": struct} |  |  | 0 |
| »»state | 保养状态 | enum_int | {"0":"无保养","1":"有保养"} |  |  | 0 |
| »»last_maintain_type | 上一次保养类型 | enum_int | {"1":"飞行器基础保养","2":"飞行器常规保养","3":"飞行器深度保养"} |  |  | 0 |
| »»last_maintain_time | 上一次保养时间 | date | {"unit_name":"秒 / s"} |  |  | 0 |
| »»last_maintain_flight_time | 上一次保养时飞行航时 | int | {"unit_name":"小时 / h"} |  |  | 0 |
| »»last_maintain_flight_sorties | 上一次保养时飞行架次 | int | {"max":"2147483647","min":"0","step":"1"} |  |  | 0 |
| total_flight_sorties | 飞行器累计飞行总架次 | int | {"max":"2147483647","min":"0","step":"1"} |  | r | 0 |
| type_subtype_gimbalindex | 负载编号 | struct |  | 与字段 payload_index 保持一致 | r | 0 |
| »gimbal_pitch | 云台俯仰轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »gimbal_roll | 云台横滚轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »gimbal_yaw | 云台偏航轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »measure_target_longitude | 激光测距目标经度 | double | {"max":"180","min":"-180","unit_name":"度 / °"} |  | r | 0 |
| »measure_target_latitude | 激光测距目标纬度 | double | {"max":"90","min":"-90","unit_name":"度 / °"} |  | r | 0 |
| »measure_target_altitude | 激光测距目标海拔 | double | {"unit_name":"米 / m"} |  | r | 0 |
| »measure_target_distance | 激光测距距离 | double | {"unit_name":"米 / m"} |  | r | 0 |
| »measure_target_error_state | 激光测距状态 | enum_int | {"0":"NORMAL","1":"TOO_CLOSE","2":"TOO_FAR","3":"NO_SIGNAL"} |  | r | 0 |
| »payload_index | 负载索引，格式为 {type-subtype-gimbalindex} | text |  |  |  | 0 |
| »zoom_factor | 变焦倍数 | double |  |  |  | 0 |
| »thermal_current_palette_style | 调色盘样式 | enum_int | {"0":"白热","1":"黑热","2":"描红","3":"医疗","5":"彩虹 1","6":"铁红","8":"北极","11":"熔岩","12":"热铁","13":"彩虹 2"} | 红外相机提供多种调色样式，用户可根据不同的场景选择不同的色彩，便于更加清晰地查看目标 | rw | 0 |
| »thermal_supported_palette_styles | 设备支持的调色盘样式集合 | array | {"size": -, "item_type": enum_int} | 不同设备所支持的样式能力有所不同 | r | 1 |
| »thermal_gain_mode | 增益模式 | enum_int | {"0":"自动","1":"低增益, 测温范围0°C-500°C","2":"高增益, 测温范围-20°C-150°C"} | 低增益提供更大的测温范围，高增益拥有更高的测温精度 | rw | 0 |
| »thermal_isotherm_state | 是否开启等温线 | enum_int | {"0":"关闭","1":"开启"} | 等温线允许用户观测自己感兴趣的温度区间的内容，让兴趣温度区间的物体能更加凸显 | rw | 0 |
| »thermal_isotherm_upper_limit | 测温区间上限 | int | {"unit_name":"摄氏度 / °C"} | 仅启用等温线功能后有效 | rw | 0 |
| »thermal_isotherm_lower_limit | 测温区间下限 | int | {"unit_name":"摄氏度 / °C"} | 仅启用等温线功能后有效 | rw | 0 |
| »thermal_global_temperature_min | 全局画面中测量的最低温度 | float | {"unit_name":"摄氏度 / °C"} |  | r | 0 |
| »thermal_global_temperature_max | 全局画面中测量的最高温度 | float | {"unit_name":"摄氏度 / °C"} |  | r | 0 |
| track_id | 航迹 ID | text | {"length":"64"} |  | r | 0 |
| position_state | 搜星状态 | struct |  |  | r | 0 |
| »is_fixed | 是否收敛 | enum_int | {"0":"未开始","1":"收敛中","2":"收敛成功","3":"收敛失败"} |  |  | 0 |
| »quality | 搜星档位 | enum_int | {"1":"1档","2":"2档","3":"3档","4":"4档","5":"5档","10":"RTK fixed"} |  |  | 0 |
| »gps_number | GPS 搜星数量 | int |  |  |  | 0 |
| »rtk_number | RTK 搜星数量 | int |  |  |  | 0 |
| storage | 存储容量 | struct |  | kb | r | 0 |
| »total | 总容量 | int | {"unit_name":"千字节 / KB"} |  |  | 0 |
| »used | 已使用容量 | int | {"unit_name":"千字节 / KB"} |  |  | 0 |
| battery | 飞行器电池信息 | struct |  |  | r | 0 |
| »capacity_percent | 电池的总剩余电量 | int | {"max":100,"min":0} |  |  | 0 |
| »remain_flight_time | 剩余飞行时间 | int | {"unit_name":"秒 / s"} |  |  | 0 |
| »return_home_power | 返航所需电量百分比 | int | {"max":100,"min":0} |  |  | 0 |
| »landing_power | 强制降落电量百分比 | int | {"max":100,"min":0} |  |  | 0 |
| »batteries | 电池详细信息 | array | {"size": -, "item_type": struct} |  |  | 0 |
| »»capacity_percent | 电池剩余电量 | int | {"max":100,"min":0} |  |  | 0 |
| »»index | 电池序号 | int | {"min":"0"} |  |  | 0 |
| »»sn | 电池序列号（SN） | text |  |  |  | 0 |
| »»type | 电池类型 | enum_int | {} |  |  | 0 |
| »»sub_type | 电池子类型 | enum_int | {} |  |  | 0 |
| »»firmware_version | 固件版本 | text |  |  |  | 0 |
| »»loop_times | 电池循环次数 | int |  |  |  | 0 |
| »»voltage | 电压 | int | {"unit_name":"毫伏 / mV"} |  |  | 0 |
| »»temperature | 温度 | float | {"unit_name":"摄氏度 / °C"} | 保留小数点后一位 |  | 0 |
| »»high_voltage_storage_days | 高电压存储天数 | int | {"unit_name":"日 / day"} |  |  | 0 |
| total_flight_distance | 飞行器累计飞行总里程 | float | {"unit_name":"米 / m"} |  | r | 0 |
| total_flight_time | 飞行器累计飞行航时 | float | {"unit_name":"秒 / s"} |  | r | 0 |
| serious_low_battery_warning_threshold | 严重低电量告警 | int |  | 用户设置的电池严重低电量告警百分比 | r | 1 |
| low_battery_warning_threshold | 低电量告警 | int |  | 用户设置的电池低电量告警百分比 | r | 1 |
| control_source | 当前控制源 | text |  | 可以为设备，也可以为某个浏览器。设备使用 A/B 表示 A 控，B 控，浏览器以自生成的 uuid 作为标识符 | r | 1 |
| wind_direction | 当前风向 | enum_int | {"1":"正北","2":"东北","3":"东","4":"东南","5":"南","6":"西南","7":"西","8":"西北"} |  | r | 0 |
| wind_speed | 风速 | float | {"unit_name":"0.1 米每秒 / m/s"} | 风速估计，该风速是通过飞行器姿态推测出的，有一定的误差，仅供参考，不能作为气象数据使用 | r | 0 |
| home_distance | 距离 Home 点的距离 | float |  |  | r | 0 |
| home_latitude | Home 点纬度 | double |  |  | r | 1 |
| home_longitude | Home 点经度 | double |  |  | r | 1 |
| attitude_head | 偏航轴角度 | int |  | 偏航轴角度与真北角（经线）的角度，0到6点钟方向为正值，6到12点钟方向为负值 | r | 0 |
| attitude_roll | 横滚轴角度 | float |  |  | r | 0 |
| attitude_pitch | 俯仰轴角度 | float |  |  | r | 0 |
| elevation | 相对起飞点高度 | float |  |  | r | 0 |
| height | 绝对高度 | double |  | 相对地球椭球面高度, 计算：相对起飞点的高度 + 起飞点的椭球高 | r | 0 |
| latitude | 当前位置纬度 | double | {"max":"3.4028235E38","min":"-1.4E-45","step":"0.1"} |  | r | 0 |
| longitude | 当前位置经度 | double | {"max":"3.4028235E38","min":"-1.4E-45","step":"0.1"} |  | r | 0 |
| vertical_speed | 垂直速度 | float | {"unit_name":"米每秒 / m/s"} |  | r | 0 |
| horizontal_speed | 水平速度 | float |  |  | r | 0 |
| firmware_upgrade_status | 固件升级状态 | enum_int | {"0":"未升级","1":"升级中"} |  | r | 1 |
| compatible_status | 固件一致性 | enum_int | {"0":"不需要一致性升级","1":"需要一致性升级"} | 一致性升级：指飞行器某些模块的固件版本与系统匹配版本不一致，需要进行升级。常见的情况例如：飞行器与遥控器已经升级至最新版本，但替换电池时发现电池未升级，此时一致性升级将被提示。普通升级：开发者将飞行器所有模块升级至指定固件版本。 | r | 1 |
| firmware_version | 固件版本 | text | {"length":"64"} |  | r | 1 |
| gear | 档位 | enum_int | {"0":"A","1":"P","2":"NAV","3":"FPV","4":"FARM","5":"S","6":"F","7":"M","8":"G","9":"T"} |  | r | 0 |
| mode_code_reason | 飞行器进入当前状态的原因 | enum_int | {"0":"无意义","1":"电池电量不足（返航、降落）","2":"电池电压不足（返航、降落）","3":"电压严重过低（返航、降落）","4":"遥控器按键请求（起飞、返航、降落）","5":"App 请求（起飞、返航、降落）","6":"遥控信号丢失（返航、降落、悬停）","7":"导航、SDK 等外部设备触发（起飞、返航、降落）","8":"进入机场限飞区（降落）","9":"虽然触发了返航但是因为距离 Home 点距离太近（降落）","10":"虽然触发了返航但是因为距离 Home 点距离太远（降落）","11":"执行航点任务时请求（起飞）","12":"返航阶段到达 Home 点上方后请求（降落）","13":"飞行器高度下降，距地面 0.7m（二段降落限低）时，继续下降导致（降落）","14":"App、SDK 等设备强制突破限低保护进行（降落）","15":"因为周围有航班经过而请求（返航、降落）","16":"因为高度控制失败请求（返航、降落）","17":"智能低电量返航后进入（降落）","18":"AP控制飞行模式（手动飞行）","19":"硬件异常（返航、降落）","20":"防触地保护结束（降落）","21":"返航取消 (悬停)","22":"返航时遇到障碍物（降落）","23":"机场场景下大风触发（返航）"} |  | r | 1 |
| commander_flight_height | 指点飞行高度 | float | {"max":3000,"min":2,"step":0.1,"unit_name":"米 / m"} | 相对(机场)起飞点的高度，相对高 ALT | rw | 1 |
| commander_flight_mode | 指点飞行模式设置值 | enum_int | {"0":"智能高度飞行","1":"设定高度飞行"} | 指点飞行模式设置值 | rw | 1 |
| commander_mode_lost_action | 指点飞行失控动作 | enum_int | {"0":"继续执行指点飞行任务","1":"退出指点飞行任务，执行普通失控行为"} | 执行指点飞行时失控了，选择继续执行完，还是执行普通失控行为 | rw | 1 |
| camera_watermark_settings | 相机水印设置 | struct |  | 用户对相机拍摄的照片和录像文件进行水印配置, 目前暂不支持直播画面水印 | rw | 1 |
| »global_enable | 水印显示全局开关 | enum_int | {"0":"关闭","1":"开启"} | 需要开启全局开关才能显示水印 | rw | 1 |
| »drone_type_enable | 机型显示开关 | enum_int | {"0":"关闭","1":"开启"} |  | rw | 1 |
| »drone_sn_enable | 飞行器序列号显示开关 | enum_int | {"0":"关闭","1":"开启"} |  | rw | 1 |
| »datetime_enable | 日期时间显示开关 | enum_int | {"0":"关闭","1":"开启"} | 时区默认为当地时区 | rw | 1 |
| »gps_enable | 经纬度&海拔高显示开关 | enum_int | {"0":"关闭","1":"开启"} |  | rw | 1 |
| »user_custom_string_enable | 自定义文案显示开关 | enum_int | {"0":"关闭","1":"开启"} |  | rw | 1 |
| »user_custom_string | 自定义文案内容 | text |  | 最多可显示 250 字节 | rw | 1 |
| »layout | 水印在画面中位置 | enum_int | {"0":"左上","1":"左下","2":"右上","3":"右下"} |  | rw | 1 |
| mode_code | 飞行器状态 | enum_int | {"0":"待机","1":"起飞准备","2":"起飞准备完毕","3":"手动飞行","4":"自动起飞","5":"航线飞行","6":"全景拍照","7":"智能跟随","8":"ADS-B 躲避","9":"自动返航","10":"自动降落","11":"强制降落","12":"三桨叶降落","13":"升级中","14":"未连接","15":"APAS","16":"虚拟摇杆状态","17":"指令飞行","18":"空中 RTK 收敛模式","19":"机场选址中","20":"POI环绕","21":"进离场航线飞行过程中"} | 机场选址指飞行器在空中悬停，为机场选址以及检查 RTK 信号质量 | r | 0 |
| distance_limit_status | 飞行器限远状态 | struct |  |  | rw | 0 |
| »state | 是否开启限远 | enum_int | {"0":"未设置","1":"已设置"} |  |  | 0 |
| »distance_limit | 限远距离 | int | {"max":"8000","min":"15","step":"1","unit_name":"米 / m"} |  |  | 0 |
| »is_near_distance_limit | 是否接近设定的限制距离 | enum_int | {"0":"未达到设定的限制距离","1":"接近设定的限制距离"} |  | r | 0 |
| rth_altitude | 返航高度 | int | {"max":500,"min":20,"unit_name":"米 / m"} | 返航高度 | rw | 0 |
| psdk_ui_resource | psdk ui 资源包 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »psdk_index | psdk 负载设备索引 | int | {"min":0} |  | r | 1 |
| »psdk_ready | psdk 就绪状态 | enum_int | {"0":"未就绪","1":"已就绪"} |  | r | 1 |
| »object_key | oss 对象 | text |  |  | r | 1 |
| psdk_widget_values | psdk 负载设备属性值 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »psdk_index | psdk 负载设备索引 | int | {"min":0} |  | r | 1 |
| »psdk_name | 设备名称 | text |  |  | r | 1 |
| »psdk_sn | 设备序号 | text |  |  | r | 1 |
| »psdk_version | 设备固件版本 | text |  |  | r | 1 |
| »psdk_lib_version | psdk lib 版本 | text |  |  | r | 1 |
| »speaker | 喊话器状态 | struct |  |  | r | 1 |
| »»work_mode | 喊话器工作模式 | enum_int | {"0":"TTS 负载模式","1":"录音喊话"} |  | r | 1 |
| »»play_mode | 喊话器播放模式 | enum_int | {"0":"单次播放","1":"循环播放(单曲)"} |  | r | 1 |
| »»play_volume | 喊话器音量 | int | {"max":100,"min":0,"step":1} |  | r | 1 |
| »»system_state | 喊话器状态 | enum_int | {"0":"空闲中","1":"传输中(机场到飞行器)","2":"播放中","3":"异常中","4":"TTS 文本转换中","99":"下载中(机场从云端下载)"} |  | r | 1 |
| »»play_file_name | 喊话器最近一次播放的文件名称 | text | {"length":128,"unit_name":"字节 / B"} |  | r | 1 |
| »»play_file_md5 | 喊话器最近一次播放的文件md5校验和 | text |  |  | r | 1 |
| »values | psdk 控件值列表 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »»index | 控件编号 | int | {"min":0,"step":1} |  | r | 1 |
| »»value | 控件值 | int | {} |  | r | 1 |
| remaining_power_for_return_home | 返航预留电量 | int | {"max":100,"min":0} | **注意：预留返航电量设置过低可能导致飞机没有足够电量完成返航。对于 DJI Dock 3，我们建议将该值设置在 15% ~ 50% 范围内以提供更安全的返航电量预留。** | rw | 1 |
