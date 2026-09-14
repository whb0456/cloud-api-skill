---
title: "设备属性"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/m4-series/properties.html
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
| offline_map_enable | 离线地图开关 | bool | {"0":"关闭","1":"开启"} | 当离线地图关闭后，离线地图同步不再进行自动同步 | r | 1 |
| dongle_infos | 4G Dongle信息 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »imei | dongle imei | text |  | Dongle 的唯一识别标志 | r | 0 |
| »dongle_type | Dongle 类型 | enum_int | {"6":"旧 Dongle","10":"支持 eSIM 的新 Dongle"} | Dongle 类型 | r | 0 |
| »eid | dongle eid | text |  | eSIM 的唯一识别标志，用于公众号查询套餐、购买服务 | r | 0 |
| »esim_activate_state | eSIM 激活状态 | enum_int | {"0":"未激活","1":"已激活"} | 需要激活才能使用 | r | 0 |
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
| obstacle_avoidance | 飞行器避障状态 | struct |  |  | r | 0 |
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
| type_subtype_gimbalindex | {{type-subtype-gimbalindex}_aembLbhPpc} | struct |  | 与字段 payload_index 保持一致 | r | 0 |
| »gimbal_pitch | 云台俯仰轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »gimbal_roll | 云台横滚轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »gimbal_yaw | 云台偏航轴角度 | double | {"max":"180","min":"-180","step":0.1,"unit_name":"度 / °"} |  |  | 0 |
| »payload_index | 负载索引，格式为 {type-subtype-gimbalindex} | text | {"length":""} |  |  | 0 |
| »zoom_factor | 变焦倍数 | double | {"max":"","min":"","step":"","unit_name":null} |  |  | 0 |
| track_id | 航迹 ID | text | {"length":"64"} |  | r | 0 |
| position_state | 搜星状态 | struct |  |  | r | 0 |
| »is_fixed | 是否收敛 | enum_int | {"0":"未开始","1":"收敛中","2":"收敛成功","3":"收敛失败"} |  |  | 0 |
| »quality | 搜星档位 | enum_int | {"1":"1档","2":"2档","3":"3档","4":"4档","5":"5档","10":"RTK fixed"} |  |  | 0 |
| »gps_number | GPS 搜星数量 | int | {"max":"","min":"","step":"","unit_name":null} |  |  | 0 |
| »rtk_number | RTK 搜星数量 | int | {"max":"","min":"","step":"","unit_name":null} |  |  | 0 |
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
| home_latitude | Home 点纬度 | float |  |  | r | 1 |
| home_longitude | Home 点经度 | float |  |  | r | 1 |
| attitude_head | 偏航轴角度 | int |  | 偏航轴角度与真北角（经线）的角度，0到6点钟方向为正值，6到12点钟方向为负值 | r | 0 |
| attitude_roll | 横滚轴角度 | float |  |  | r | 0 |
| attitude_pitch | 俯仰轴角度 | float |  |  | r | 0 |
| elevation | 相对起飞点高度 | float |  |  | r | 0 |
| height | 绝对高度 | float |  | 相对地球椭球面高度, 计算：相对起飞点的高度 + 起飞点的椭球高 | r | 0 |
| latitude | 当前位置纬度 | float | {"max":"3.4028235E38","min":"-1.4E-45","step":"0.1"} |  | r | 0 |
| longitude | 当前位置经度 | float | {"max":"3.4028235E38","min":"-1.4E-45","step":"0.1"} |  | r | 0 |
| vertical_speed | 垂直速度 | float | {"unit_name":"米每秒 / m/s"} |  | r | 0 |
| horizontal_speed | 水平速度 | float |  |  | r | 0 |
| firmware_upgrade_status | 固件升级状态 | enum_int | {"0":"未升级","1":"升级中"} |  | r | 1 |
| compatible_status | 固件一致性 | enum_int | {"0":"不需要一致性升级","1":"需要一致性升级"} | 一致性升级：指飞行器某些模块的固件版本与系统匹配版本不一致，需要进行升级。常见的情况例如：飞行器与遥控器已经升级至最新版本，但替换电池时发现电池未升级，此时一致性升级将被提示。普通升级：开发者将飞行器所有模块升级至指定固件版本。 | r | 1 |
| firmware_version | 固件版本 | text | {"length":"64"} |  | r | 0 |
| gear | 档位 | enum_int | {"0":"A","1":"P","2":"NAV","3":"FPV","4":"FARM","5":"S","6":"F","7":"M","8":"G","9":"T"} |  | r | 0 |
| mode_code_reason | 飞行器进入当前状态的原因 | enum_int | {"0":"无意义","1":"电池电量不足（返航、降落）","2":"电池电压不足（返航、降落）","3":"电压严重过低（返航、降落）","4":"遥控器按键请求（起飞、返航、降落）","5":"App 请求（起飞、返航、降落）","6":"遥控信号丢失（返航、降落、悬停）","7":"导航、SDK 等外部设备触发（起飞、返航、降落）","8":"进入机场限飞区（降落）","9":"虽然触发了返航但是因为距离 Home 点距离太近（降落）","10":"虽然触发了返航但是因为距离 Home 点距离太远（降落）","11":"执行航点任务时请求（起飞）","12":"返航阶段到达 Home 点上方后请求（降落）","13":"飞行器高度下降，距地面 0.7m（二段降落限低）时，继续下降导致（降落）","14":"App、SDK 等设备强制突破限低保护进行（降落）","15":"因为周围有航班经过而请求（返航、降落）","16":"因为高度控制失败请求（返航、降落）","17":"智能低电量返航后进入（降落）","18":"AP控制飞行模式（手动飞行）","19":"硬件异常（返航、降落）","20":"防触地保护结束（降落）","21":"返航取消 (悬停)","22":"返航时遇到障碍物（降落）"} |  | r | 1 |
| commander_flight_height | 指点飞行高度 | float | {"max":3000,"min":2,"step":0.1,"unit_name":"米 / m"} | 相对(机场)起飞点的高度，相对高 ALT | rw | 1 |
| commander_flight_mode | 指点飞行模式设置值 | enum_int | {"0":"智能高度飞行","1":"设定高度飞行"} | 指点飞行模式设置值 | rw | 1 |
| current_commander_flight_mode | 指点飞行模式当前值 | enum_int | {"0":"智能高度飞行","1":"设定高度飞行"} | 指点飞行模式当前值 | r | 1 |
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
| mode_code | 飞行器状态 | enum_int | {"0":"待机","1":"起飞准备","2":"起飞准备完毕","3":"手动飞行","4":"自动起飞","5":"航线飞行","6":"全景拍照","7":"智能跟随","8":"ADS-B 躲避","9":"自动返航","10":"自动降落","11":"强制降落","12":"三桨叶降落","13":"升级中","14":"未连接","15":"APAS","16":"虚拟摇杆状态","17":"指令飞行","18":"空中 RTK 收敛模式","19":"机场选址中"} | 机场选址指飞行器在空中悬停，为机场选址以及检查 RTK 信号质量 | r | 0 |
