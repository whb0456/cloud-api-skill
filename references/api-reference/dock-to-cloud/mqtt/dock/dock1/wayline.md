---
title: "航线管理"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dock-to-cloud/mqtt/dock/dock1/wayline.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 机场任务准备异常通知

该接口在航线任务和指令飞行任务准备阶段都支持上报

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** flight_setup_exception_notify

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| sn | 机场SN | text | {"length":""} |  |
| timeout_time | 异常超时时间 | int | {"max":"10","min":"2","step":"2","unit_name":"分钟 / min"} |  |
| timestamp | 当前UTC时间 | double |  |  |
| flight_type | 任务类型 | int | {"max":"2","min":"1","step":"","unit_name":null} | 1表示航线任务，2表示指令飞行任务 |

**Example:**

```
{
	"bid": "34bb18e0-ecbc-45c5-89a8-0d4b1689f499",
	"data": {
		"flight_id": "c7f17df6-e7cc-4465-a252-d9587c6bbb37",
		"flight_type": 1,
		"sn": "xxxxxxxx",
		"timeout_time": 6,
		"timestamp": 1724126480015
	},
	"gateway": "xxxxxxxx",
	"method": "flight_setup_exception_notify",
	"need_reply": 1,
	"tid": "d6503c74-65ad-448a-b9f5-916dc1b00acb",
	"timestamp": 1724126480015
}
```

**Topic:** thing/product/{gateway_sn}/events_reply

**Direction:** down

**Method:flight_setup_exception_notify**

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
	"method": "flight_setup_exception_notify"
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
	"timestamp": 1654070968655,
	"method": "device_exit_homing_notify"
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
| »»index | 断点序号 | int |  |  |
| »»state | 断点状态 | enum_int | {"0":"在航段上","1":"在航点上"} |  |
| »»progress | 当前航段进度 | float | {"max":"1.0","min":"0"} |  |
| »»wayline_id | 航线 ID | int |  |  |
| »»break_reason | 中断原因 | enum_int | {"0":"无异常","1":"Mission ID 不存在，该航线任务未执行","2":"不常见错误，建议联系技术支持","4":"请求开始/恢复航线任务时，航线文件加载出错，请重新尝试上传文件开始或联系技术支持","5":"请求查询断点信息时，查询断点文件失败。请求恢复航线任务时，解析断点类型失败","6":"请求开始/结束航线任务时，cmd参数有误，协议请求的指令有误。请求恢复航线任务时，解析断点类型失败","7":"请求开始/恢复航线任务时，解析 wpmz 文件超时，请重试","257":"航线已经开始，不能再次开始","258":"此状态下无法中断航线，只允许在航线执行状态时暂停航线","259":"航线未开始，不能结束航线","261":"飞行任务冲突，无法获取飞行器控制权，不允许在降落和返航中开始航线","262":"该状态下无法恢复航线，只允许在航线暂停状态时恢复航线","513":"飞行器超过限高高度","514":"飞行器超过限远距离","515":"航线穿过限飞区，机场无法执行飞行任务","516":"飞行器触发限低","517":"飞行器触发避障","518":"RTK 信号差","519":"接近禁飞区边界","521":"超过机场限飞区限高","522":"航线请求起飞失败","523":"起飞任务执行失败","524":"请求航线任务失败","526":"请求航线 RTK 收敛任务失败","527":"航线 RTK 收敛任务运行失败","528":"接近用户自定义飞行区边界","769":"GPS 信号弱","770":"遥控器档位不在 N 档，无法开始任务","771":"返航点未刷新","772":"当前电量过低无法开始任务","773":"低电量返航导致航线中断","775":"遥控器与飞行器失联","778":"飞行器在地面起桨，不允许开始航线","779":"实时仿地过程中，视觉状态异常（如过亮，过暗，两侧亮度不一致）","780":"实时仿地用户设置的仿地高度不合法（大于 200 m 或者小于 30 m）","781":"实时仿地过程中全局地图计算出错","784":"大风返航导致航线中断","1281":"用户退出","1282":"用户中断","1283":"用户触发返航","1539":"开始信息（航点 index 或者 progress）错误","1540":"使用不支持的坐标系","1541":"使用不支持的高度模式","1542":"使用不支持的过渡航线模式","1543":"使用不支持的 yaw 模式","1544":"使用不支持的 yaw 方向调转模式","1545":"使用不支持的航点类型","1546":"首尾点不能使用协调转弯类型","1547":"航线全局速度超过合理范围","1548":"航点数量异常","1549":"经纬度数据异常","1550":"转弯截距异常","1551":"航段最大速度超过合理范围","1552":"航段目标速度超过合理范围","1553":"航点 yaw 角度超过合理范围","1555":"断点续飞的 mission_id 输入错误","1556":"断点续飞的 progress 信息输入错误","1557":"断点续飞的任务状态异常","1558":"断点续飞的航点 index 信息输入错误","1559":"断点续飞的经纬度信息输入错误","1560":"断点续飞的航点 yaw 输入错误","1561":"断点续飞的标志位设置错误","1563":"航线生成失败","1564":"航线运行失败","1565":"航线避障紧急刹停","1588":"无法识别的动作类型","1595":"同一动作组内动作 ID 不能重复","1598":"动作 ID 值不能为 65535","1602":"动作组数量超过合理范围","1603":"动作组生效范围错误","1606":"断点续飞中动作 index 超过合理范围","1608":"断点信息中触发器运行结果异常","1609":"断点续飞中动作组 ID 信息不能重复","1610":"断点续飞中动作组位置不能重复","1611":"断点续飞中动作组位置超过合理范围","1612":"续飞中动作 ID 不在断点信息中","1613":"续飞中不能修改动作状态为中断","1614":"断点信息错误导致续飞失败","1634":"无法识别的动作类型","1649":"无法识别的触发器类型","65534":"未知错误","65535":"未知错误"} |  |
| »»latitude | 断点纬度 | float | {"max":"90","min":"-90","unit_name":"度 / °"} |  |
| »»longitude | 断点经度 | float | {"max":"180","min":"-180","unit_name":"度 / °"} |  |
| »»height | 断点相对地球椭球面高度 | float | {"unit_name":"米 / m"} |  |
| »»attitude_head | 断点偏航轴角度 | float |  | 偏航轴角度与真北角（经线）的角度，0到6点钟方向为正值，6到12点钟方向为负值 |
| »wayline_id | 当前在作业的航线 ID | int |  | 包括进入航线的过渡阶段，例如0代表飞行器正在进入或者已经在执行第一条航线 |
| status | 任务状态 | enum_string | {"canceled":"取消或终止","failed":"失败","in_progress":"执行中","ok":"执行成功","partially_done":"部分完成","paused":"暂停","rejected":"拒绝","sent":"已下发","timeout":"超时"} |  |
| progress | 进度 | struct |  |  |
| »current_step | 执行步骤 | enum_int | {"0":"初始状态","1":"启动前检查，飞行器是否在执行航线中","2":"启动前检查，机场是否退出工作模式","3":"启动前检查，航线执行中","4":"启动前检查，返航中","5":"航线执行进入准备状态，开始等待任务下发","6":"机场进入工作状态","7":"进入开机检查准备工作和开盖准备工作","8":"等待飞行系统准备就绪，推送连接建立","9":"等待 RTK 源监听有值上报","10":"检查 RTK 源是否是机场源，如果不是要重新设置","11":"等待飞行控制权通知","12":"机场无控制权，抢夺飞行器控制权","13":"自定义飞行区一致性检查","14":"离线地图一致性检查","15":"获取最新 KMZ URL","16":"下载 KMZ","17":"KMZ 上传中","18":"染色配置","19":"飞行器起飞参数设置，备降点设置，起飞高度设置，染色设置","20":"飞行器 flyto 起飞参数设置","21":"Home 点设置","22":"触发执行航线","23":"航线执行中","24":"进入返航的检查准备工作","25":"飞行器降落机场","26":"降落以后的关盖","27":"机场退出工作模式","28":"机场异常恢复","29":"机场上传飞行系统日志","30":"相机录像状态检查","31":"获取媒体文件数量","32":"机场起飞开盖的异常恢复","33":"通知任务结果","34":"任务执行完成，通过配置文件配置，是否进行主动 log 拉取","35":"日志列表拉取 - 飞行器列表","36":"日志列表拉取 - 拉取机场列表","37":"日志列表拉取 - 上传日志列表结果","38":"日志拉取-拉取飞行器日志","39":"日志拉取-拉取机场日志","40":"日志拉取-压缩飞行器日志","41":"日志拉取-压缩机场日志","42":"日志拉取-上传飞行器日志","43":"日志拉取-上传机场日志","44":"日志拉取-通知结果","45":"自定义飞行区文件更新准备中","46":"自定义飞行区更新中","47":"离线地图更新准备中","48":"离线地图更新中","65533":"结束后等待服务回包","65534":"无具体状态","65535":"UNKNOWN"} |  |
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

## 返航信息

**Topic:** thing/product/{gateway_sn}/events

**Direction:** up

**Method:** return_home_info

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| planned_path_points | 规划的轨迹点列表 | array | {"size": -, "item_type": struct} | 飞行器实时规划的返航路线，数组中为一条完整的返航路线，每次推送为全量更新 |
| »latitude | 轨迹点纬度(角度值) | double | {"max":90,"min":-90} | 轨迹点纬度，角度值，南纬是负，北纬是正，精度到小数点后6位 |
| »longitude | 轨迹点经度(角度值) | double | {"max":180,"min":-180} | 轨迹点经度，角度值，东经是正，西经是负，精度到小数点后6位 |
| »height | 轨迹点高度 | float | {"step":0.1,"unit_name":"米 / m"} | 轨迹点高度，椭球高 |
| last_point_type | 返航路径最后一个点的类型 | enum_int | {"0":"轨迹最后一个点在返航点的上空","1":"轨迹最后一个点不在返航点上空"} | 轨迹planned_path_points最后一个点的类型。可用此字段，决定轨迹最后一个点的显示方式。0：轨迹最后一个点在返航点的地面上空。终端可以显示轨迹最后一个点到返航点的连线；1：轨迹最后一个点不是返航点。终端不应显示轨迹最后一个点到返航点的连线。无法到达返航点的原因：返航点在禁飞区或障碍物内 |
| flight_id | 任务 ID | text |  | 当前正在执行的航线任务 ID |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"flight_id": "abc",
		"last_point_type": 0,
		"planned_path_points": [
			{
				"height": 123.234,
				"latitude": 13.23,
				"longitude": 123.234
			}
		]
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1654070968655,
	"method": "return_home_info"
}
```

# Service

## 取消准备中的任务

仅支持航线任务和指令飞行任务准备阶段，在Home点设置状态（current_step为21）进行调用。也就是起飞命令下发后，RTK 数据还没有收敛时进行调用。和flighttask_undo的区别是：flighttask_undo仅取消未开始执行的任务。

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flight_setup_abort

**Data:** null

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flight_setup_abort

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| result | 返回码 | int | {"max":"","min":"","step":"","unit_name":null} | 0: Success 326108: 当前状态不支持，326109:因飞行器已经起飞，不支持取消，可通过返航按钮取消 |

**Example:**

```
{
	"bid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"data": {
		"result": 0
	},
	"tid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
	"timestamp": 1234567890123,
	"method": "flight_setup_abort"
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
| »sign | 文件 MD5 签名 | text |  |  |

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
	"timestamp": 1654070968655,
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
	"timestamp": 1654070968655,
	"method": "flighttask_create"
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
| flight_id | 计划 ID | text |  |  |
| execute_time | 开始执行时间 | int | {"length":13} | 任务开始执行时间毫秒时间戳。可选字段。当 `task_type` 为 0 或 1 时必填，为 2 时非必填。 |
| task_type | 任务类型 | enum_int | {"0":"立即任务","1":"定时任务","2":"条件任务"} | 立即任务和定时任务均由 `execute_time` 指定执行时间。条件任务支持 `ready_conditions` 字段指定任务就绪条件。任务可在指定时间段内满足一定条件后即可执行。立即任务媒体上传优先级最高，定时任务和条件任务媒体上传优先级相同。 |
| file | 航线文件对象 | struct |  |  |
| »url | 文件 URL | text |  |  |
| »fingerprint | 文件 MD5 签名 | text |  |  |
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
| rth_altitude | 返航高度 | int | {"max":1500,"min":20,"unit_name":"米 / m"} |  |
| out_of_control_action | 遥控器失控动作 | enum_int | {"0":"返航","1":"悬停","2":"降落"} | 失控动作，当前固定传的值是 0，即返航。注意该枚举值定义跟飞控跟机场定义的不一致，机场端会进行转换。 |
| exit_wayline_when_rc_lost | 航线失控动作 | enum_int | {"0":"继续执行航线任务","1":"退出航线任务，执行遥控器失控动作"} | 保持跟 KMZ 文件一致 |
| simulate_mission | 是否在模拟器中执行任务 | struct |  | 可选字段，用于在室内进行模拟任务调试。；**注意：进行模拟飞行前，请务必取下桨叶，以防舱盖关闭时夹断桨叶。** |
| »is_enable | 是否开启模拟器任务 | enum_int | {"0":"不开启","1":"开启"} | 当次任务打开或关闭模拟器 |
| »latitude | 纬度 | double | {"max":"90.0","min":"-90.0"} |  |
| »longitude | 经度 | double | {"max":"180.0","min":"-180.0"} |  |

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
			"longitude": 113.2222
		},
		"task_type": 2
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
	"method": "flighttask_prepare"
}
```

## 执行任务

**Topic:** thing/product/{gateway_sn}/services

**Direction:** down

**Method:** flighttask_execute

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
	"method": "flighttask_execute"
}
```

**Topic:** thing/product/{gateway_sn}/services_reply

**Direction:** up

**Method:** flighttask_execute

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
	"method": "flighttask_execute"
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

# Requests

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
| »»fingerprint | 文件 MD5 签名 | text |  |  |

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
