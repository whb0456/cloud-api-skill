---
title: "航线管理"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock3/wayline.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

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
| last_point_type | 返航路径最后一个点的类型 | enum_int | {"0":"轨迹最后一个点在返航点的上空","1":"轨迹最后一个点不在返航点上空"} |  |
| flight_id | 任务 ID | text | {"length":""} |  |
| home_dock_sn | home点机场sn | text | {"length":""} | 蛙跳任务中当前选择的机场home点SN，普通任务无该字段 |
| multi_dock_home_info | 蛙跳任务机场返航信息 | array | {"size": 2, "item_type": struct} | 普通任务无该字段 |
| »sn | 机场SN | text | {"length":""} |  |
| »plan_status | 路径规划状态 | enum_int | {"0":"规划失败或正在规划中","1":"规划路径不可达","2":"规划路径因电量不可达","3":"目标可达"} |  |
| »estimated_battery_consumption | 预估电量消耗 | int | {"max":"100","min":"0","step":"1","unit_name":null} |  |
| »home_distance | home点距离 | float | {"max":"","min":"","step":"","unit_name":"米 / m"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"home_dock_sn": "6QCDL870020164",
		"last_point_type": 0,
		"multi_dock_home_info": [
			{
				"estimated_battery_consumption": 30,
				"home_distance": 298.3277282714844,
				"plan_status": 3,
				"sn": "6QCDL870020164"
			},
			{
				"estimated_battery_consumption": 30,
				"home_distance": 298.289794921875,
				"plan_status": 3,
				"sn": "6QCDL820020041"
			}
		],
		"planned_path_points": [
			{
				"height": 60.285194396972656,
				"latitude": 22.755022128112614,
				"longitude": 114.89828051067889
			},
			{
				"height": 88.22719192504883,
				"latitude": 22.755022128112614,
				"longitude": 114.89828051067889
			},
			{
				"height": 88.22719192504883,
				"latitude": 22.75721542071551,
				"longitude": 114.89853624254465
			},
			{
				"height": 88.22719192504883,
				"latitude": 22.757445462048054,
				"longitude": 114.89860304631293
			},
			{
				"height": 78.30619430541992,
				"latitude": 22.757531544193625,
				"longitude": 114.89862810820341
			}
		]
	},
	"gateway": "6QCDL820020041",
	"method": "return_home_info",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1720000266772
}
```

## 任务就绪通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** flighttask_ready

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_ids | 计划 ID | array | {"size": -, "item_type": text} | 当前满足任务就绪条件的任务 ID 集合 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_ids": [
			"aaaaaaa",
			"bbbbbbb"
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_ready"
}
```

## 上报航线任务进度

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** flighttask_progress

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| ext | 扩展内容 | struct |  |  |
| »current_waypoint_index | 当前执行到的航点数 | int |  |  |
| »wayline_mission_state | 航线任务状态 | enum_int | {"0":"断连","1":"不支持该航点","2":"航线准备状态,可上传文件,可执行已有文件","3":"航线文件上传中","4":"触发开始命令，飞行器触发读航线等逻辑，还未开始任务，处于准备状态","5":"进入航线,到第一个航点","6":"航线执行","7":"航线中断，触发条件：1.用户主动暂停 2.飞控异常","8":"航线恢复","9":"航线停止"} |  |
| »media_count | 本次航线任务执行产生的媒体文件数量 | int |  |  |
| »track_id | 航迹 ID | text |  |  |
| »flight_id | 任务 ID | text |  |  |
| »break_point | 航线断点信息 | struct |  | 可选字段，用于告知云端本次航线任务断点信息 |
| »»index | 断点序号 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»state | 断点状态 | enum_int | {"0":"在航段上","1":"在航点上"} |  |
| »»progress | 当前航段进度 | float | {"max":"1.0","min":"0","step":"","unit_name":null} |  |
| »»wayline_id | 航线 ID | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»break_reason | 中断原因 | enum_int | {"0":"无异常","1":"Mission ID 不存在，该航线任务未执行","2":"不常见错误，建议联系技术支持","4":"请求开始/恢复航线任务时，航线文件加载出错，请重新尝试上传文件开始或联系技术支持","5":"请求查询断点信息时，查询断点文件失败。请求恢复航线任务时，解析断点类型失败","6":"请求开始/结束航线任务时，cmd参数有误，协议请求的指令有误。请求恢复航线任务时，解析断点类型失败","7":"请求开始/恢复航线任务时，解析 wpmz 文件超时，请重试","257":"航线已经开始，不能再次开始","258":"此状态下无法中断航线，只允许在航线执行状态时暂停航线","259":"航线未开始，不能结束航线","261":"飞行任务冲突，无法获取飞行器控制权，不允许在降落和返航中开始航线","262":"该状态下无法恢复航线，只允许在航线暂停状态时恢复航线","513":"飞行器超过限高高度","514":"飞行器超过限远距离","515":"航线穿过限飞区，机场无法执行飞行任务","516":"飞行器触发限低","517":"飞行器触发避障","518":"RTK 信号差","519":"接近禁飞区边界","521":"超过机场限飞区限高","522":"航线请求起飞失败","523":"起飞任务执行失败","524":"请求航线任务失败","526":"请求航线 RTK 收敛任务失败","527":"航线 RTK 收敛任务运行失败","769":"GPS 信号弱","770":"遥控器档位不在 N 档","771":"返航点未刷新","772":"当前电量过低无法开始任务","773":"低电量返航导致航线中断","775":"遥控器与飞行器失联","778":"飞行器在地面起桨，不允许开始航线","779":"实时仿地过程中，相机状态异常（如过亮，过暗，两侧亮度不一致）","780":"实时仿地用户设置的仿地高度不合法（大于 200 m 或者小于 30 m）","781":"实时仿地过程中全局地图计算出错","784":"大风返航导致航线中断","1281":"用户退出","1282":"用户中断","1283":"用户触发返航","1539":"开始信息（航点 index 或者 progress）错误","1540":"使用不支持的坐标系","1541":"使用不支持的高度模式","1542":"使用不支持的过渡航线模式","1543":"使用不支持的 yaw 模式","1544":"使用不支持的 yaw 方向调转模式","1545":"使用不支持的航点类型","1546":"首尾点不能使用协调转弯类型","1547":"航线全局速度超过合理范围","1548":"航点数量异常","1549":"经纬度数据异常","1550":"转弯截距异常","1551":"航段最大速度超过合理范围","1552":"航段目标速度超过合理范围","1553":"航点 yaw 角度超过合理范围","1555":"断点续飞的 mission_id 输入错误","1556":"断点续飞的 progress 信息输入错误","1557":"断点续飞的任务状态异常","1558":"断点续飞的航点 index 信息输入错误","1559":"断点续飞的经纬度信息输入错误","1560":"断点续飞的航点 yaw 输入错误","1561":"断点续飞的标志位设置错误","1563":"航线生成失败","1564":"航线运行失败","1565":"航线避障紧急刹停","1588":"无法识别的动作类型","1595":"动作 ID 不能重复","1598":"动作 ID 值不能为 65535","1602":"动作组数量超过合理范围","1603":"动作组生效范围错误","1606":"断点续飞中动作 index 超过合理范围","1608":"断点信息中触发器运行结果异常","1609":"断点续飞中动作组 ID 信息不能重复","1610":"断点续飞中动作组位置不能重复","1611":"断点续飞中动作组位置超过合理范围","1612":"续飞中动作 ID 不在断点信息中","1613":"断点续飞中不能修改动作状态为中断","1614":"断点信息错误导致续飞失败","1634":"无法识别的动作类型","1649":"无法识别的触发器类型","65534":"未知内部错误","65535":"未知内部错误"} |  |
| »»latitude | 断点纬度 | float | {"max":"90","min":"-90","step":"","unit_name":"度 / °"} |  |
| »»longitude | 断点经度 | float | {"max":"180","min":"-180","step":"","unit_name":"度 / °"} |  |
| »»height | 断点相对地球椭球面高度 | float | {"max":"","min":"","step":"","unit_name":"米 / m"} |  |
| »»attitude_head | 断点偏航轴角度 | float | {"max":"","min":"","step":"","unit_name":null} |  |
| »wayline_id | 当前在作业的航线 ID | int |  | 包括进入航线的过渡阶段，例如0代表飞行器正在进入或者已经在执行第一条航线 |
| status | 任务状态 | enum_string | {"canceled":"取消或终止","failed":"失败","in_progress":"执行中","ok":"执行成功","partially_done":"部分完成","paused":"暂停","rejected":"拒绝","sent":"已下发","timeout":"超时"} |  |
| progress | 进度 | struct |  |  |
| »current_step | 执行步骤 | enum_int | {"0":"初始状态","1":"启动前检查，飞行器是否在执行航线中","2":"启动前检查，机场是否退出工作模式","3":"启动前检查，航线执行中","4":"启动前检查，返航中","5":"航线执行进入准备状态，开始等待任务下发","6":"机场进入工作状态","7":"进入开机检查准备工作和开盖准备工作","8":"图传远程对频","9":"等待飞行系统准备就绪，推送连接建立","10":"等待 RTK 源监听有值上报","11":"检查 RTK 源是否是机场源，如果不是要重新设置","12":"等待飞行控制权通知","13":"机场无控制权，抢夺飞行器控制权","14":"自定义飞行区一致性检查","15":"离线地图一致性检查","16":"获取最新 KMZ URL","17":"下载 KMZ","18":"KMZ 上传中","19":"染色配置","20":"飞行器起飞参数设置，备降点设置，起飞高度设置，染色设置","21":"飞行器 flyto 起飞参数设置","22":"起飞机场检查降落机场准备状态","23":"Home 点设置","24":"触发执行航线","25":"航线执行中","26":"进入返航的检查准备工作","27":"飞行器降落机场","28":"降落以后的关盖","29":"机场退出工作模式","30":"机场异常恢复","31":"机场上传飞行系统日志","32":"相机录像状态检查","33":"获取媒体文件数量","34":"机场起飞开盖的异常恢复","35":"通知任务结果","36":"日志列表拉取 - 飞行器列表","37":"日志列表拉取 - 拉取机场列表","38":"日志列表拉取 - 上传日志列表结果","39":"日志拉取-拉取飞行器日志","40":"日志拉取-拉取机场日志","41":"日志拉取-压缩飞行器日志","42":"日志拉取-压缩机场日志","43":"日志拉取-上传飞行器日志","44":"日志拉取-上传机场日志","45":"日志拉取-通知结果","46":"自定义飞行区文件更新准备中","47":"自定义飞行区更新中","48":"离线地图更新准备中","49":"离线地图更新中","65533":"结束后等待服务回包","65534":"无具体状态","65535":"UNKNOWN"} |  |
| »percent | 进度值 | int | {"max":"100","min":"0","step":"1"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"ext": {
				"break_point": {
					"attitude_head": 30,
					"break_reason": 1,
					"height": 100.23,
					"index": 1,
					"latitude": 23.4,
					"longitude": 113.99,
					"progress": 0.34,
					"state": 0,
					"wayline_id": 0
				},
				"current_waypoint_index": 3,
				"flight_id": "flight_id",
				"media_count": 6,
				"track_id": "track_id",
				"wayline_id": 0,
				"wayline_mission_state": 9
			},
			"progress": {
				"current_step": 19,
				"percent": 100
			},
			"status": "ok"
		},
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_progress"
}
```

## 设备返航退出状态通知

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** device_exit_homing_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| sn | 机场 SN | text | {} |  |
| action | 退出返航通知消息类型 | enum_int | {"0":"退出”返航退出状态“","1":"进入”返航退出状态“"} | 进入“返航退出状态”，指当机场处于返航模式时，由于 `reason` 字段中展示的原因，退出了返航过程。相似的，退出“返航退出状态”，指机场停止了退出返航这一过程。 |
| reason | 退出返航原因 | enum_int | {"0":"操纵杆油门添加","1":"操纵杆间距添加","2":"行为树初始化失败","3":"被障碍物包围","4":"触发限飞限制","5":"障碍物距离太近","6":"无 GPS 信号","7":"GPS 和 VIO 位置输出标志为 false","8":"GPS 和 VIO 融合位置误差太大","9":"短距离回溯","10":"近距离触发返航"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"action": 1,
		"reason": "0",
		"sn": "机场 SN"
	},
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp:": 1654070968655,
	"method": "device_exit_homing_notify"
}
```

## 空中下发航线状态上报

**Method:** `in_flight_wayline_progress`

**Topic:** `thing/product/{gateway_sn}/events`

**Direction:** up

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| in_flight_wayline_id | 航线任务ID | string |  | 空中航线任务的唯一标识符 |
| progress | 任务进度 | object |  | 任务进度信息 |
| progress.percent | 完成百分比 | int | `{min: 0, max: 100}` | 任务完成百分比 |
| status | 任务状态码 | int |  | **状态码说明：** `status`: `1`: 上传文件中 (`wayline_uploading`) `2`: 文件上传成功 (`wayline_uploaded`) `3`: 执行任务中 (`wayline_progress`) `4`: 任务暂停 (`wayline_paused`) `5`: 任务取消 (`wayline_cancel`) `6`: 任务成功 (`wayline_ok`) `7`: 任务失败 (`wayline_failed`)任务失败时的错误码`8`: 任务超时 |
| result | 错误原因码 | int |  |  |
| way_point_index | 当前航点索引 | int |  | 当前执行的航点索引 |

**Example:**

```
{
    "in_flight_wayline_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
    "progress": {
        "percent": 100
    },
    "status": 0,
    "result": 0,
    "way_point_index": 0
}
```

# Service

## 执行任务

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_execute

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_id | 计划 ID | text | {"length":""} |  |
| multi_dock_task | 蛙跳任务参数 | struct |  | 用于蛙跳任务，普通航线任务无需下发此参数，只下发flight_id即可 |
| »wireless_link_topo | 图传连接拓扑 | struct |  |  |
| »»secret_code | 加密编码 | array | {"size": 28, "item_type": int} | 从飞行器的设备属性中获取 |
| »»center_node | 飞行器对频信息 | struct |  | 从飞行器的设备属性中获取 |
| »»»sdr_id | 扰码信息 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»»sn | 设备sn | text | {"length":""} |  |
| »»leaf_nodes | 机场或遥控器对频信息 | array | {"size": -, "item_type": struct} |  |
| »»»sdr_id | 扰码信息 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»»sn | 设备sn | text | {"length":""} |  |
| »»»control_source_index | 控制源序号 | int | {"max":"2","min":"1","step":"1","unit_name":"无 / "} |  |
| »dock_infos | 机场信息 | array | {"size": 2, "item_type": struct} | 执行本次蛙跳任务的机场信息，除了dock_type需要指定外，其他字段均可从设备属性上报中直接获取 |
| »»dock_type | 机场在蛙跳任务中的角色 | enum_string | {"landing":"降落","takeoff":"起飞机场"} |  |
| »»latitude | 纬度 | double | {"max":"90","min":"-90","step":"0.01"} | 机场纬度，可从机场设备属性中获取 |
| »»longitude | 经度 | double | {"max":"180","min":"-180","step":"0.01"} | 机场经度，可从机场设备属性中获取 |
| »»height | 椭球高度 | double | {"unit_name":"米 / m"} | 机场高度，可从机场设备属性中获取 |
| »»heading | 机场朝向角 | double | {"max":"180","min":"-180","step":"","unit_name":"度 / °"} | 机场朝向角，可从机场设备属性中获取 |
| »»home_position_is_valid | 机场home点有效性 | enum_int | {"0":"无效","1":"有效"} | 可从机场设备属性中获取 |
| »»index | 机场任务唯一性标识 | int | {"max":"31","min":"1"} | 给机场分配的序号，单次任务中保持唯一且最好长期固定使用 |
| »»sn | 机场SN | text | {"length":""} |  |
| »»rtcm_info | 机场RTK标定源 | struct |  |  |
| »»»mount_point | 网络RTK挂载点信息 | text | {"length":""} |  |
| »»»port | 网络端口信息 | text | {"length":""} |  |
| »»»host | 网络host信息 | text | {"length":""} |  |
| »»»rtcm_device_type | 设备类型 | enum_int | {"1":"机场"} |  |
| »»»source_type | 标定类型 | enum_int | {"0":"未标定","1":"自收敛标定","2":"手动标定","3":"网络RTK标定"} |  |
| »»alternate_land_point | 备降点 | struct |  |  |
| »»»longitude | 经度 | float | {} |  |
| »»»latitude | 纬度 | float | {} |  |
| »»»safe_land_height | 安全高度(备降转移高) | float | {} |  |
| »»»is_configured | 是否设置备降点 | enum_int | {"0":"未设置","1":"已设置"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "aee739dc-f1cc-47d5-beaa-64d327f2d797",
		"multi_dock_task": {
			"dock_infos": [
				{
					"alternate_land_point": {
						"height": 0,
						"is_configured": 1,
						"latitude": 37.348792490321514,
						"longitude": 116.52867090782102,
						"safe_land_height": 30
					},
					"dock_type": "takeoff",
					"heading": -78.7066650390625,
					"height": 30.81130027770996,
					"home_position_is_valid": 1,
					"index": 1,
					"latitude": 37.3487657248638,
					"longitude": 116.52893686422743,
					"rtcm_info": {
						"host": "120.253.226.97",
						"mount_point": "RTCM33_GRCEJ",
						"port": "8002",
						"rtcm_device_type": 1,
						"source_type": 3
					},
					"sn": "7CTDM5900B3X1B"
				},
				{
					"alternate_land_point": {
						"height": 0,
						"is_configured": 1,
						"latitude": 37.336024417709915,
						"longitude": 116.554075635852,
						"safe_land_height": 30
					},
					"dock_type": "landing",
					"heading": -69.79183197021484,
					"height": 32.31420135498047,
					"home_position_is_valid": 1,
					"index": 2,
					"latitude": 37.33605462094235,
					"longitude": 116.55416413516038,
					"rtcm_info": {
						"host": "120.253.226.97",
						"mount_point": "RTCM33_GRCEJ",
						"port": "8002",
						"rtcm_device_type": 1,
						"source_type": 3
					},
					"sn": "7CTDM5900BK07M"
				}
			],
			"wireless_link_topo": {
				"center_node": {
					"sdr_id": 933765657,
					"sn": "1581F6Q8D245P00EKS87"
				},
				"leaf_nodes": [
					{
						"control_source_index": 1,
						"sdr_id": 920128532,
						"sn": "7CTDM5900B3X1B"
					},
					{
						"control_source_index": 2,
						"sdr_id": 911741468,
						"sn": "7CTDM5900BK07M"
					}
				],
				"secret_code": [
					0,
					0,
					0,
					0,
					1,
					0,
					0,
					0,
					123,
					114,
					19,
					203,
					192,
					100,
					244,
					160,
					146,
					228,
					196,
					213,
					105,
					220,
					176,
					147,
					87,
					182,
					90,
					210
				]
			}
		}
	},
	"method": "flighttask_execute",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1720095314016
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_execute

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
	"timestamp": 1234567890123,
	"method": "flighttask_execute"
}
```

## 指定home点的返航

蛙跳任务中，需要指定一个机场作为返航目的地时使用

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** return_specific_home

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| home_dock_sn | 返航的目的机场SN | text | {"length":""} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"home_dock_sn": "xxxxxxxx"
	},
	"method": "return_specific_home",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** return_specific_home

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
	"method": "return_specific_home",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1695634358385
}
```

## 任务终止

蛙跳任务中，当一个机场上报任务结束后，需要下发此指令到另一机场结束任务

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_stop

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_id | 任务id | text | {"length":""} |  |
| reason | 结束原因 | enum_int | {"0":"正常结束","1":"另一机场状态机异常"} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
		"reason": 0
	},
	"method": "flighttask_stop",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_stop

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
	"method": "flighttask_stop",
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1695634358385
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
| result | 返回码 | int |  | 非 0 代表错误 |

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

## 一键返航

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** return_home

**Data:** null

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** return_home

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »status | 任务状态 | enum_string | {"canceled":"取消或终止","failed":"失败","in_progress":"执行中","ok":"执行成功","paused":"暂停","rejected":"拒绝","sent":"已下发","timeout":"超时"} |  |

## 航线恢复

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_recovery

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_recovery"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_recovery

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
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_recovery"
}
```

## 航线暂停

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_pause

**Data:** null

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_pause"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_pause

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
	"need_reply": 1,
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "flighttask_pause"
}
```

## 取消任务

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_undo

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_ids | 计划 ID | array | {"size": -, "item_type": text} |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_ids": [
			"aaaaaaa",
			"bbbbbbb"
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123,
	"method": "flighttask_undo"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_undo

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
	"timestamp": 1234567890123,
	"method": "flighttask_undo"
}
```

## 下发任务

若用户的云服务无法访问外网，需实现 `配置更新` 功能，下发可被云服务访问的 NTP 服务的 URL，以实现时钟同步，否则航线任务将无法正常执行。

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_prepare

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_id | 计划 ID | text | {"length":""} |  |
| execute_time | 开始执行时间 | int | {"max":"","min":"","step":"","unit_name":null} | 任务开始执行时间毫秒时间戳。可选字段。当 `task_type` 为 0 或 1 时必填，为 2 时非必填。 |
| task_type | 任务类型 | enum_int | {"0":"立即任务","1":"定时任务","2":"条件任务"} | 立即任务和定时任务均由execute_time指定执行时间；条件任务支持ready_conditions字段指定任务就绪条件，设备可在指定时间段内满足就绪条件后即可执行；立即任务媒体上传优先级最高，定时任务和条件任务媒体上传优先级相同 |
| file | 航线文件对象 | struct |  |  |
| »url | 文件 URL | text |  |  |
| »fingerprint | 文件签名 | text |  | 文件内容 MD5 签名 |
| ready_conditions | 任务就绪条件 | struct |  | 可选字段。条件任务（即 `task_type` 为2）时必填，其他类型任务会忽略该字段。下发条件任务后，设备会定频检查 `ready_conditions` 是否全部满足，若全部满足则会有 `flighttask_ready` 事件通知。且设备端接收 `flighttask_execute` 指令时，也会检查任务的 `ready_conditions` 是否已全部满足。 |
| »battery_capacity | 电池容量 | int |  | 可执行任务的飞行器电池电量百分比阈值，任务开始执行时的飞行器电量必须大于 `battery_capacity`。 |
| »begin_time | 任务可执行时段的开始时间 | int | {"length":13} | 任务可执行时段起始时间毫秒时间戳，任务开始执行的时间必须大于 `begin_time`。 |
| »end_time | 任务可执行时段的结束时间 | int | {"length":13} | 任务可执行时段截止时间毫秒时间戳，任务开始执行的时间必须小于 `end_time`。 |
| executable_conditions | 任务执行条件 | struct |  | 可选字段，用于在设备端增加任务执行的前置检查条件，存在任一条件不满足时会执行失败 |
| »storage_capacity | 存储容量 | int |  | 可执行任务的机场或飞行器最低存储容量，机场或飞行器存储容量不满足 `storage_capacity` 时，任务执行失败。 |
| break_point | 航线断点信息 | struct |  | 可选字段，用于断点续飞，若指定该字段，航线任务会从字段指定的断点位置开始执行。 |
| »index | 断点序号 | int |  |  |
| »state | 断点状态 | enum_int | {"0":"在航段上","1":"在航点上"} |  |
| »progress | 当前航段进度 | float | {"max":"1.0","min":"0"} |  |
| »wayline_id | 航线 ID | int |  |  |
| rth_altitude | 返航高度 | int | {"max":1500,"min":20,"step":"","unit_name":"米 / m"} |  |
| rth_mode | 返航高度模式 | enum_int | {"0":"智能高度","1":"设定高度"} | 智能返航模式下，飞行器将自动规划最佳返航高度。大疆机场当前不支持设置返航高度模式，只能选择'设定高度'模式。当环境，光线不满足视觉系统要求时（譬如傍晚阳光直射、夜间弱光无光），飞行器将使用您设定的返航高度进行直线返航 |
| out_of_control_action | 遥控器失控动作 | enum_int | {"0":"返航","1":"悬停","2":"降落"} | 失控动作，当前固定传的值是 0，即返航。注意该枚举值定义跟飞控跟机场定义的不一致，机场端会进行转换。 |
| exit_wayline_when_rc_lost | 航线失控动作 | enum_int | {"0":"继续执行航线任务","1":"退出航线任务，执行遥控器失控动作"} | 保持跟 KMZ 文件一致 |
| wayline_precision_type | 航线精度类型 | enum_int | {"0":"GPS 任务","1":"高精度 RTK 任务"} | 高精度 RTK 任务：飞行器起飞后会在空中等待 RTK 收敛后再执行任务，等待 RTK 收敛的过程中无法暂停任务。默认场景建议使用该模式。GPS 任务：飞行器无需等待 RTK 收敛便可以直接开始执行。精度要求不高的任务或对起飞时效性要求较高的任务建议使用该模式。 |
| simulate_mission | 是否在模拟器中执行任务 | struct |  | 可选字段，用于在室内进行模拟任务调试。；**注意：进行模拟飞行前，请务必取下桨叶，以防舱盖关闭时夹断桨叶。** |
| »is_enable | 是否开启模拟器任务 | enum_int | {"0":"不开启","1":"开启"} | 当次任务打开或关闭模拟器 |
| »latitude | 纬度 | double | {"max":"90.0","min":"-90.0"} |  |
| »longitude | 经度 | double | {"max":"180.0","min":"-180.0"} |  |
| »altitude | 高度 | double | {"max":"9999.9","min":"-9999.9"unit_name":"米 / m"} |  |
| flight_safety_advance_check | 飞行安全预检查 | bool | {"0":"关闭","1":"开启"} | 设置一键起飞和航线任务中的飞行安全是否预先检查。此字段为可选，默认为0，值为0表示关闭，1表示开启。飞行安全预先检查表示: 飞行器执行任务前，检查自身作业区文件是否与云端一致，如果不一致则拉取文件更新，如果一致则不处理 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"break_point": {
			"index": 1,
			"progress": 0.34,
			"state": 0,
			"wayline_id": 0
		},
		"executable_conditions": {
			"storage_capacity": 1000
		},
		"execute_time": 1234567890123,
		"exit_wayline_when_rc_lost": 0,
		"file": {
			"fingerprint": "xxxx",
			"url": "https://xxx.com/xxxx"
		},
		"flight_id": "xxxxxxx",
		"flight_safety_advance_check": 1,
		"out_of_control_action": 0,
		"ready_conditions": {
			"battery_capacity": 90,
			"begin_time": 1234567890123,
			"end_time": 1234567890123
		},
		"rth_altitude": 100,
		"simulate_mission": {
			"is_enable": 1,
			"latitude": 22.1223,
			"longitude": 113.2222,
			"altitude": 66.6
		},
		"task_type": 2,
		"wayline_precision_type": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123,
	"method": "flighttask_prepare"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_prepare

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
	"timestamp": 1234567890123,
	"method": "flighttask_prepare"
}
```

## 创建航线任务（废弃）

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_create

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_id | 计划 ID | text |  |  |
| type | 任务类型 | text |  |  |
| file | 航线文件对象 | struct |  |  |
| »url | 文件 URL | text |  |  |
| »sign | MD5 签名 | text |  |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"file": {
			"sign": "xxxx",
			"url": "https://xxx.com/xxxx"
		},
		"flight_id": "xxxxxxx",
		"type": "wayline"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp:": 1654070968655,
	"method": "flighttask_create"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_create

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
	"timestamp:": 1654070968655,
	"method": "flighttask_create"
}
```

## 空中下发航线

飞行器处于空中飞行时，可以下发一些文件体积较小的航线

**Method:** `in_flight_wayline_deliver`

**Topic:** `thing/product/{gateway_sn}/services`

**Direction:** down

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| bid | 请求标识 | string |  | 请求的唯一标识符 |
| tid | 任务标识 | string |  | 任务的唯一标识符 |
| timestamp | 时间戳 | int64 |  | 请求的时间戳 |
| method | 方法名 | string |  | 固定为 `in_flight_wayline_deliver` |
| data | 数据 | object |  | 下发航线的具体数据 |
| data.file | 文件信息 | object |  | 航线文件信息 |
| data.file.fingerprint | 文件指纹 | string |  | 用于校验文件完整性 |
| data.file.url | 文件下载地址 | string |  | 航线文件的下载地址 |
| data.in_flight_wayline_id | 航线任务ID | string |  | 空中航线任务的唯一标识符 |
| data.out_of_control_action | 失控动作 | int | `{0: "返航", 1: "悬停", 2: "降落"}` | 遥控器失控时的动作 |
| data.exit_wayline_when_rc_lost | 失联动作 | int | `{0: "继续执行", 1: "执行飞控失控动作"}` | 航线失联时的动作 |
| data.rth_altitude | 返航高度 | int | `{min: 20, max: 1500}` | 返航高度，单位：米 |
| data.rth_mode | 返航模式 | int | `{0: "智能高度", 1: "设定高度"}` | 返航高度模式 |
| data.wayline_precision_type | 航线精度类型 | int | `{0: "GPS任务", 1: "高精度RTK任务"}` | 航线精度类型 |

**Example:**

```
{
    "bid": "d26db6b4-3bb0-432c-bdb2-a8e53c827b72",
    "tid": "a5d95abe-e99c-4931-95cc-e2f3fdbc488f",
    "timestamp": 1731135221528,
    "method": "in_flight_wayline_deliver",
    "data": {
        "file": {
            "fingerprint": "7a7cea5060c55920b7619a2a981f2223",
            "url": "XXXX"
        },
        "in_flight_wayline_id": "f2b31c13-3fce-4a7e-b188-87a78ff2f8a6",
        "out_of_control_action": 1,
        "exit_wayline_when_rc_lost": 0,
        "rth_altitude": 120,
        "rth_mode": 1,
        "wayline_precision_type": 1
    }
}
```

**Topic:** `thing/product/{gateway_sn}/services_reply`

**Direction:** up

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
    "result": 0
}
```

## 暂停空中航线

**Method:** `in_flight_wayline_stop`

**Topic:** `thing/product/{gateway_sn}/services`

**Direction:** down

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| bid | 请求标识 | string |  | 请求的唯一标识符 |
| tid | 任务标识 | string |  | 任务的唯一标识符 |
| timestamp | 时间戳 | int64 |  | 请求的时间戳 |
| method | 方法名 | string |  | 固定为 `in_flight_wayline_stop` |
| data | 数据 | object |  | 暂停航线的具体数据 |
| data.in_flight_wayline_id | 航线任务ID | string |  | 空中航线任务的唯一标识符 |

**Example:**

```
{
    "bid": "bf1d9985-5077-4ea5-9f2b-44edbcde9a11",
    "tid": "9da675b5-0a87-4b89-9813-4fb2e3aac4ec",
    "timestamp": 1731136137237,
    "method": "in_flight_wayline_stop",
    "data": {
        "in_flight_wayline_id": "36747381-4886-4ed0-9b2b-2919d6d4863c"
    }
}
```

**Topic:** `thing/product/{gateway_sn}/services_reply`

**Direction:** up

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
    "result": 0
}
```

## 恢复空中航线

**Method:** `in_flight_wayline_recover`

**Topic:** `thing/product/{gateway_sn}/services`

**Direction:** down

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| bid | 请求标识 | string |  | 请求的唯一标识符 |
| tid | 任务标识 | string |  | 任务的唯一标识符 |
| timestamp | 时间戳 | int64 |  | 请求的时间戳 |
| method | 方法名 | string |  | 固定为 `in_flight_wayline_recover` |
| data | 数据 | object |  | 恢复航线的具体数据 |
| data.in_flight_wayline_id | 航线任务ID | string |  | 空中航线任务的唯一标识符 |

**Example:**

```
{
    "bid": "8fd307b9-6a70-465c-aeb7-5edac860017b",
    "tid": "b3a76306-2576-4bc5-9a55-77e4f8f3b17c",
    "timestamp": 1731136244583,
    "method": "in_flight_wayline_recover",
    "data": {
        "in_flight_wayline_id": "36747381-4886-4ed0-9b2b-2919d6d4863c"
    }
}
```

**Topic:** `thing/product/{gateway_sn}/services_reply`

**Direction:** up

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
    "result": 0
}
```

## 取消空中航线

**Method:** `in_flight_wayline_cancel`

**Topic:** `thing/product/{gateway_sn}/services`

**Direction:** down

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| bid | 请求标识 | string |  | 请求的唯一标识符 |
| tid | 任务标识 | string |  | 任务的唯一标识符 |
| timestamp | 时间戳 | int64 |  | 请求的时间戳 |
| method | 方法名 | string |  | 固定为 `in_flight_wayline_cancel` |
| data | 数据 | object |  | 取消航线的具体数据 |

**Example:**

```
{
    "bid": "8fd307b9-6a70-465c-aeb7-5edac860017b",
    "tid": "b3a76306-2576-4bc5-9a55-77e4f8f3b17c",
    "timestamp": 1731136244583,
    "method": "in_flight_wayline_cancel",
    "data": {}
}
```

**Topic:** `thing/product/{gateway_sn}/services_reply`

**Direction:** up

**Data:**

| Column | Name | Type | Constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |

**Example:**

```
{
    "result": 0
}
```

# Requests

## 机场任务状态获取

蛙跳任务中，机场需要请求另一机场的任务执行状态

**Topic:** thing/product/{gateway_sn}/requests

**Direction:** up

**Method:** flighttask_progress_get

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| sn | 目标设备sn | text | {"length":""} |  |

**Topic:** thing/product/{gateway_sn}/requests_reply

**Direction:** down

**Method:** flighttask_progress_get

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »flight_id | 设备最新当前任务id | text | {"length":""} |  |
| »progress | 任务进度 | struct |  | 字段枚举值同上报航线任务进度flighttask_progress中progress字段 |
| »»current_step | 执行步骤 | int | {"max":"","min":"","step":"","unit_name":null} |  |
| »»percent | 执行进度 | int | {"max":"100","min":"0","step":"","unit_name":null} |  |
| »status | 任务状态 | text | {"length":""} | 字段枚举值同上报航线任务进度flighttask_progress中status字段 |

## 任务资源获取

**Topic:** thing/product/{gateway_sn}/requests

**Direction:** up

**Method:** flighttask_resource_get

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| flight_id | 计划 ID | text |  |  |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "xxxxxxx"
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123,
	"method": "flighttask_resource_get"
}
```

**Topic:** thing/product/{gateway_sn}/requests_reply

**Direction:** down

**Method:** flighttask_resource_get

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int |  | 非 0 代表错误 |
| output | 输出 | struct |  |  |
| »file | 航线文件对象 | struct |  |  |
| »»url | 文件 URL | text |  |  |
| »»fingerprint | 文件签名 | text |  | 文件 MD5 签名 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"output": {
			"file": {
				"fingerprint": "signxxxx",
				"url": "https://xx.oss-cn-hangzhou.aliyuncs.com/xx.kmz?Expires=xx&OSSAccessKeyId=xxx&Signature=xxx"
			}
		},
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123,
	"method": "flighttask_resource_get"
}
```
