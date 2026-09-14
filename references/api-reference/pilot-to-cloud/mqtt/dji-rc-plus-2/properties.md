---
title: "设备属性"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/properties.html
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
| live_capacity | 网关设备直播能力 | struct |  |  | r | 1 |
| »available_video_number | 可选择推流的码流数量 | int | {"max":"","min":"","step":"","unit_name":null} |  |  | 0 |
| »coexist_video_number_max | 可同时推流的最大码流数量 | int | {"max":"","min":"","step":"","unit_name":null} |  |  | 0 |
| »device_list | 可选择的视频设备源 | array | {"size": -, "item_type": struct} | 可选择的视频设备源（设备层，比如飞行器） |  | 0 |
| »»sn | 飞行器等视频源设备序列号（SN） | text |  |  |  | 0 |
| »»available_video_number | 该序列号设备可以被选择推流的码流数 | int |  |  |  | 0 |
| »»coexist_video_number_max | 该序列号设备可以同时被推流的码流数 | int |  |  |  | 0 |
| »»camera_list | 该序列号设备上的相机列表 | array | {"size": -, "item_type": struct} |  |  | 0 |
| »»»camera_index | 相机索引 | text |  | 使用 {type-subtype-gimbalindex} 的格式 |  | 0 |
| »»»available_video_number | 该相机级别的视频源可以被选择推流的码流数 | int |  |  |  | 0 |
| »»»coexist_video_number_max | 该相机级别的视频源可以同时被推流的码流数 | int |  |  |  | 0 |
| »»»video_list | 该相机级别的视频源可以选择的码流列表 | array | {"size": -, "item_type": struct} |  |  | 0 |
| »»»»video_index | 该相机级别的视频源可以选择的码流索引 | text |  |  |  | 0 |
| »»»»video_type | 该相机级别的视频源可以选择的码流类型 | text |  |  |  | 0 |
| »»»»switchable_video_types | 该视频流支持切换的视频镜头类型 | array | {"size": -, "item_type": text} |  |  | 0 |
| capacity_percent | 剩余电量 | int | {"max":"100","min":"0","step":"1","unit_name":"百分比 / %"} | 遥控器剩余电量 | r | 0 |
| height | 椭球高度 | double | {"max":"","min":"","step":"","unit_name":"米 / m"} |  | r | 0 |
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
| live_status | 网关当前整体直播状态推送 | array | {"size": -, "item_type": struct} |  | r | 1 |
| »video_id | 直播码流标识符 | text |  | 某路在推视频码流的标识符，格式为 *{sn}/{camera_index}/{video_index}*。其中 {sn} 为视频源设备序列号。{camera_index} 为相机索引，使用 {type-subtype-gimbalindex} 的格式。{video_index} 为该相机级别的视频源可以选择的码流索引。 |  | 0 |
| »video_type | 视频类型 | text | {"length":"24"} | 表明视频镜头的类型，如normal/wide/zoom/infrared等 |  | 0 |
| »video_quality | 直播码流的质量 | enum_int | {"0":"自动","1":"流畅","2":"高清","3":"超清"} |  |  | 0 |
| »status | 直播状态 | enum_int | {"0":"未直播","1":"在直播"} |  |  | 0 |
| »error_status | 错误码 | int | {"length":6} |  |  | 0 |
| wireless_link | 图传链路 | struct |  |  | r | 0 |
| »dongle_number | 飞行器上 Dongle 数量 | int |  |  |  | 0 |
| »4g_link_state | 4G 链路连接状态 | enum_int | {"0":"断开","1":"连接"} |  |  | 0 |
| »sdr_link_state | SDR 链路连接状态 | enum_int | {"0":"断开","1":"连接"} |  |  | 0 |
| »link_workmode | 机场的图传链路模式 | enum_int | {"0":"SDR 模式","1":"4G 融合模式"} |  |  | 0 |
| »sdr_quality | SDR 信号质量 | int | {"max":"5","min":"0","step":"1"} |  |  | 0 |
| »4g_quality | 总体 4G 信号质量 | int | {"max":"5","min":"0","step":"1"} |  |  | 0 |
| »4g_uav_quality | 天端 4G 信号质量 | int | {"max":"5","min":"0","step":"1"} | 飞行器端与 4G 服务器之间的信号质量 |  | 0 |
| »4g_gnd_quality | 地端 4G 信号质量 | int | {"max":"5","min":"0","step":"1"} | 地面端（如遥控器、DJI Dock等）与 4G 服务器之间的信号质量 |  | 0 |
| »sdr_freq_band | SDR 频段 | float |  |  |  | 0 |
| »4g_freq_band | 4G 频段 | float |  |  |  | 0 |
| firmware_version | 固件版本 | text | {"length":"64"} |  | r | 1 |
| latitude | 纬度 | double | {"max":"90","min":"-90","step":"0.01"} |  | r | 0 |
| longitude | 经度 | double | {"max":"180","min":"-180","step":"0.01"} | 网关设备的经度 | r | 0 |
| cloud_control_auth | 本遥控器授权云控列表 | array | {"size":"-","item_type":"string"} | 标识哪些控制权授权给云端 | r | 1 |
| drc_state | DRC 链路的状态 | enum_int | {"0":"未连接","1":"连接中","2":"已连接"} |  | r | 0 |
