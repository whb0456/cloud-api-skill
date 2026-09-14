---
title: "共用元素信息"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dji-wpml/common-element.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 信息说明

WPML 航线文件的字段介绍如下：

- 仅用于 `template.kml` 文件的字段在[template.kml 说明](https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dji-wpml/template-kml.html)
- 仅用于 `waylines.wpml` 文件的字段在[waylines.wpml 说明](https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dji-wpml/waylines-wpml.html)
- `template.kml` 文件与 `waylines.wpml` 文件共用的字段在[共用元素信息](https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/dji-wpml/common-element.html)

## 共用元素

### `<wpml:droneInfo>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:droneEnumValue | 飞行器机型主类型 | 整型 | - | 飞行器主类型枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`飞行器/遥控器/机场枚举值`中的`主类型(type)` | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:droneSubEnumValue | 飞行器机型子类型 | 整型 | - | 飞行器子类型枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`飞行器/遥控器/机场枚举值`中的`子类型(sub_type)` | 必需元素；* 注：当“飞行器机型主类型”为有效值时，该元素才是必需。 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:payloadInfo>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadEnumValue | 负载机型主类型 | 整型 | - | 负载机型类型枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`type`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:payloadParam>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusMode | 负载对焦模式 | 枚举-string | - | firstPoint：首个航点自动对焦；custom：标定对焦值对焦 | - | M300 RTK，M350 RTK |
| wpml:meteringMode | 负载测光模式 | 枚举-string | - | average：全局测光；spot：点测光 | - | M300 RTK，M350 RTK |
| wpml:dewarpingEnable | 是否开启畸变矫正 | 布尔型 | - | 0：不开启；1：开启 | - | M300 RTK，M350 RTK |
| wpml:returnMode | 激光雷达回波模式 | 枚举-string | - | singleReturnStrongest：单回波；dualReturn：双回波；tripleReturn：三回波 | - | M300 RTK，M350 RTK |
| wpml:samplingRate | 负载采样率 | 整型 | Hz | 60000,；80000,；120000,；160000,；180000,；240000 | - | M300 RTK，M350 RTK |
| wpml:scanningMode | 负载扫描模式 | 枚举-string | - | repetitive：重复扫描；nonRepetitive：非重复扫描 | - | M300 RTK，M350 RTK |
| wpml:modelColoringEnable | 真彩上色 | 布尔型 |  | 0: 不上色；1: 真彩上色 | - | M300 RTK，M350 RTK |
| wpml:imageFormat | 图片格式列表 | 枚举-string（列表） |  | wide：存储广角镜头照片；zoom：存储变焦镜头照片；ir：存储红外镜头照片；narrow_band: 存储窄带镜头拍摄照片；visable：可见光照片；* 注：存储多个镜头照片，格式如“`<wpml:imageFormat>wide,ir</wpml:imageFormat>`” | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:waypointHeadingParam> & <wpml:globalWaypointHeadingParam>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:waypointHeadingMode | 飞行器偏航角模式 | 枚举-string | - | followWayline：沿航线方向。飞行器机头沿着航线方向飞至下一航点；manually：手动控制。飞行器在飞至下一航点的过程中，用户可以手动控制飞行器机头朝向；fixed：锁定当前偏航角。飞行器机头保持执行完航点动作后的飞行器偏航角飞至下一航点；smoothTransition：自定义。通过“wpml:waypointHeadingAngle”给定某航点的目标偏航角，并在航段飞行过程中均匀过渡至下一航点的目标偏航角。；towardPOI：朝向兴趣点 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:waypointHeadingAngle | 飞行器偏航角度 | 浮点型 | ° | [-180, 180]；给定某航点的目标偏航角，并在航段飞行过程中均匀过渡至下一航点的目标偏航角。 | 必需元素；* 注：当且仅当“wpml:waypointHeadingMode”为“smoothTransition”时必需 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:waypointPoiPoint | 兴趣点 | - | - | 数据格式为：纬度,经度,高度；注：仅当wpml:waypointHeadingMode为towardPOI该字段生效。目前不支持Z方向朝向兴趣点，高度可设置为0。当某一航点wpml:waypointHeadingMode设置为towardPOI后，飞行器从该航点飞向下一航点途中机头都将朝向兴趣点 | 仅当wpml:waypointHeadingMode为towardPOI时必需 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:waypointHeadingPathMode | 飞行器偏航角转动方向 | 枚举-string | - | clockwise：顺时针旋转飞行器偏航角；counterClockwise：逆时针旋转飞行器偏航角；followBadArc：沿最短路径旋转飞行器偏航角 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:waypointTurnParam>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:waypointTurnMode | 航点类型（航点转弯模式） | 枚举 - string | - | `coordinateTurn`：协调转弯，不过点，提前转弯；`toPointAndStopWithDiscontinuityCurvature`：直线飞行，飞行器到点停；`toPointAndStopWithContinuityCurvature`：曲线飞行，飞行器到点停；`toPointAndPassWithContinuityCurvature`：曲线飞行，飞行器过点不停；*注：DJI Pilot 2/司空 2 上“平滑过点，提前转弯”模式设置方法为：；1）将wpml:waypointTurnMode设置为toPointAndPassWithContinuityCurvature；2）将wpml:useStraightLine设置为1* | 必须元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:waypointTurnDampingDist | 航点转弯截距 | 浮点型 | m | (0, 航段最大长度]；* 注：两航点间航段长度必需大于两航点转弯截距之和。此元素定义了飞行器在距离该航点若干米前，提前多少距离转弯。 | 必须元素；* 注：当且仅当以下两种情况下必需“wpml:waypointTurnMode”为“coordinateTurn”“wpml:waypointTurnMode”为“toPointAndPassWithContinuityCurvature”，且“wpml:useStraightLine”为“1” | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:autoRerouteInfo>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:missionAutoRerouteMode | 任务航线绕行模式 | 布尔型 | - | 0：不开启 1：开启 | 必需元素 | M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:transitionalAutoRerouteMode | 过渡航线绕行模式 | 布尔型 | - | 0：不开启 1：开启 | 必需元素 | M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:actionGroup>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:actionGroupId | 动作组id；* 注：在一个kmz文件内该ID唯一。建议从0开始单调连续递增。 | 整型 | - | [0, 65535] | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionGroupStartIndex | 动作组开始生效的航点 | 整型 | - | [0, 65535] | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionGroupEndIndex | 动作组结束生效的航点；* 注：当“动作组结束生效的航点”与“动作组开始生效的航点”一致，则代表该动作组仅在该航点处生效。 | 整型 | - | [0, 65535]；* 注：该元素必须大于等于“actionGroupStartIndex”。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionGroupMode | 动作执行模式 | 枚举 - string | - | sequence：串行执行。即动作组内的动作依次按顺序执行。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionTrigger | 动作组触发器 | - | - | - | - | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:action | 动作列表 | - | - | - | - | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:actionTrigger>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:actionTriggerType | 动作触发器类型 | 枚举-string | - | reachPoint：到达航点时执行；betweenAdjacentPoints：航段触发，均匀转云台；multipleTiming：等时触发；multipleDistance：等距触发；* 注：“betweenAdjacentPoints”需配合动作"gimbalEvenlyRotate"使用，“multipleTiming” 配合动作 “takePhoto” 即可实现等时间隔拍照，“multipleDistance” 配合动作 “takePhoto” 即可实现等距离间隔拍照。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionTriggerParam | 动作触发器参数 | 浮点型浮点型 | s或m | > 0；* 注：当“actionTriggerType”为“multipleTiming”时，该元素表示间隔时间，单位是s。当“actionTriggerType”为“multipleDistance”时，该元素表示间隔距离，单位是m。 | - | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:action>`

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:actionId | 动作id；* 注：在一个动作组内该ID唯一。建议从0开始单调连续递增。 | 整型 | - | [0, 65535] | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionActuatorFunc | 动作类型 | 枚举-string | - | takePhoto：单拍； startRecord：开始录像；stopRecord：结束录像；focus：对焦；zoom：变焦；customDirName：创建新文件夹；gimbalRotate：旋转云台；rotateYaw：飞行器偏航；hover：悬停等待；gimbalEvenlyRotate：航段间均匀转动云台pitch角；accurateShoot：精准复拍动作（已暂停维护，建议使用orientedShoot）；orientedShoot：定向拍照动作 ；panoShot：全景拍照动作（支持M30/M30T、M3D/M3TD，M4D/M4TD，M4E/M4T）；recordPointCloud：点云录制操作 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionActuatorFuncParam | 动作参数 | - | - | - | - | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

### `<wpml:actionActuatorFuncParam>`

#### takePhoto

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:fileSuffix | 拍摄照片文件后缀 | 字符串 | - | 为生成媒体文件命名时将额外附带该后缀。 | 必需元素 | M300 RTK和M350 RTK（负载H20/H20T/H20N/H30/H30T），M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadLensIndex | 拍摄照片存储类型 | 图片格式列表 | 枚举-string（列表） | zoom: 存储变焦镜头拍摄照片；wide: 存储广角镜头拍摄照片；ir: 存储红外镜头拍摄照片；narrow_band: 存储窄带镜头拍摄照片；visable：可见光照片；注：存储多个镜头照片，格式如“`<wpml:payloadLensIndex>wide,ir,narrow_band</wpml:payloadLensIndex>`”表示同时使用广角、红外和窄带镜头 | 必需元素 | M30/M30T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:useGlobalPayloadLensIndex | 是否使用全局存储类型 | 布尔型 | - | 0：不使用全局设置；1：使用全局设置 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### startRecord

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:fileSuffix | 拍摄照片文件后缀 | 字符串 | - | 为生成媒体文件命名时将额外附带该后缀。 | 必需元素 | M300 RTK和M350 RTK (负载H20/H20T/H20N/H30/H30T)，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadLensIndex | 视频存储类型 | 视频格式列表 | 枚举-string（列表） | zoom: 存储变焦镜头拍摄视频；wide: 存储广角镜头拍摄视频；ir: 存储红外镜头拍摄视频；narrow_band: 存储窄带镜头拍摄视频；visable：可见光视频；注：存储多个镜头视频，格式如“`<wpml:payloadLensIndex>wide,ir,narrow_band</wpml:payloadLensIndex>`”表示同时使用广角、红外和窄带镜头 | 必需元素 | M30/M30T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:useGlobalPayloadLensIndex | 是否使用全局存储类型 | 布尔型 | - | 0：不使用全局设置；1：使用全局设置 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### stopRecord

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadLensIndex | 视频存储类型 | 视频格式列表 | 枚举-string（列表） | zoom: 存储变焦镜头拍摄视频；wide: 存储广角镜头拍摄视频；ir: 存储红外镜头拍摄视频；narrow_band: 存储窄带镜头拍摄视频；注：存储多个镜头视频，格式如“`<wpml:payloadLensIndex>wide,ir,narrow_band</wpml:payloadLensIndex>`” | - | M30/M30T |

#### focus

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:isPointFocus | 是否点对焦 | 布尔型 | - | 0：区域对焦 1：点对焦 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusX | 对焦点位置 | 浮点型 | - | ；* 注：对焦点或对焦区域左上角在画面的X轴（宽）坐标。0为最左侧，1为最右侧。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusY | 对焦点位置 | 浮点型 | - | ；* 注：对焦点或对焦区域左上角在画面的Y轴（高）坐标。0为最上方，1为最下方。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusRegionWidth | 对焦区域宽度比 | 浮点型 | - | ；* 注：对焦区域大小占画面整体的比例，此为宽度比 | 必需元素；* 注：当且仅当“isPointFocus”为“0”（即区域对焦）时必需。 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusRegionHeight | 对焦区域高度比 | 浮点型 | - | ；* 注：对焦区域大小占画面整体的比例，此为高度比 | 必需元素；* 注：当且仅当“isPointFocus”为“0”（即区域对焦）时必需。 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:isInfiniteFocus | 是否无穷远对焦 | 布尔型 | - | 0: 非无穷远对焦 1: 无穷远对焦 | 必需元素 | M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### zoom

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focalLength | 变焦焦距 | 浮点型 | mm | > 0 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### customDirName

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:directoryName | 新文件夹的名称 | 字符串 | - | - | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### gimbalRotate

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalHeadingYawBase | 云台偏航角转动坐标系 | 枚举-string | - | north：相对地理北 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalRotateMode | 云台转动模式 | 枚举-string | - | absoluteAngle：绝对角度，相对于正北方的角度 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalPitchRotateEnable | 是否使能云台Pitch转动 | 布尔型 | - | 0：不使能；1：使能 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalPitchRotateAngle | 云台Pitch转动角度 | 浮点型 | - | * 注：不同云台可转动范围不同 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalRollRotateEnable | 是否使能云台Roll转动 | 布尔型 | - | 0：不使能；1：使能 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalRollRotateAngle | 云台Roll转动角度 | 浮点型 | - | * 注：不同云台可转动范围不同 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalYawRotateEnable | 是否使能云台Yaw转动 | 布尔型 | - | 0：不使能；1：使能 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalYawRotateAngle | 云台Yaw转动角度 | 浮点型 | - | * 注：不同云台可转动范围不同 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalRotateTimeEnable | 是否使能云台转动时间 | 布尔型 | - | 0：不使能；1：使能 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalRotateTime | 云台完成转动用时 | 浮点型 | s | - | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### gimbalEvenlyRotate

注：“gimbalEvenlyRotate”动作为航段间均匀转动云台pitch角，其触发器类型必须为“betweenAdjacentPoints”。

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:gimbalPitchRotateAngle | 云台Pitch转动角度 | 浮点型 | - | * 注：不同云台可转动范围不同 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### rotateYaw

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:aircraftHeading | 飞行器目标偏航角（相对于地理北） | 浮点型 | ° | [-180, 180]；* 注：飞行器旋转至该目标偏航角。0°为正北方向，90°为正东方向，-90°为正西方向，-180°/180°为正南方向。 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:aircraftPathMode | 飞行器偏航角转动模式 | 枚举-string | - | clockwise：顺时针旋转；counterClockwise：逆时针旋转 | 必需元素 | M300 RTK，M350 RTK |

#### hover

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:hoverTime | 飞行器悬停等待时间 | 浮点型 | s | > 0 | 必需元素 | M300 RTK，M350 RTK，M30/M30T，M3E/M3T/M3M，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### accurateShoot

注：对于M30/M30T机型，V06.01.10.02之后的飞行器固件版本不再维护与升级accurateShoot，建议使用orientedShoot替代

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:gimbalPitchRotateAngle | 云台Pitch转动角度 | 浮点型 | ° | [-120, 45] | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:gimbalYawRotateAngle | 云台Yaw转动角度 | 浮点型 | ° | [-180, 180] | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:focusX | 目标选中框中心水平坐标 | 整型 | px | （0， 960）；*注：照片左上角为坐标原点，水平方向为X轴，竖直方向为Y轴* | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:focusY | 目标选中框中心竖直坐标 | 整型 | px | （0，720）；*注：照片左上角为坐标原点，水平方向为X轴，竖直方向为Y轴* | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:focusRegionWidth | 目标选中框宽 | 整型 | px | (0, 960) | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:focusRegionHeight | 目标选中框高 | 整型 | px | (0, 720) | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:focalLength | 变焦焦距 | 浮点型 | mm | > 0 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:aircraftHeading | 飞行器目标偏航角（相对于地理北） | 浮点型 | ° | ；* 注：飞行器旋转至该目标偏航角。0°为正北方向，90°为正东方向，-90°为正西方向，-180°/180°为正南方向。 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateFrameValid | 是否框选精准复拍目标 | 布尔型 | - | 1: 已框选目标物；0: 未框选目标物；*注：该值设置为1，复拍时飞行器会自主寻找目标进行拍摄。该值设置为0，复拍时飞行器只会按照飞行器姿态和负载姿态进行动作重复，不会自主寻找目标 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:payloadLensIndex | 拍摄照片存储类型 | - | 枚举-string（列表） | zoom: 存储变焦镜头拍摄照片；wide: 存储广角镜头拍摄照片；ir: 存储红外镜头拍摄照片；*注：存储多个镜头照片，格式如“`<wpml:payloadLensIndex>wide,ir</wpml:payloadLensIndex>`”表示同时使用广角、红外镜头 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:useGlobalPayloadLensIndex | 是否使用全局存储类型 | 布尔型 | - | 0：不使用全局设置；1：使用全局设置 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:targetAngle | 目标框角度 | 浮点型 | ° | ；*注：目标框的旋转角度(以Y轴为基准，顺时针旋转) | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:imageWidth | 照片宽度 | 整型 | px | 960 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:imageHeight | 照片高度 | 整型 | px | 720 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:AFPos | AF电机位置 | 整型 | - | - | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:gimbalPort | 云台端口号 | 整型 | - | 拍摄照片的相机安装位置；*注：M30/M30T机型该值固定为0 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateCameraType | 相机类型 | 整型 | - | 52（机型：M30双光相机）,；53（机型：M30T三光相机）,；42（机型：H20）,；43（机型：H20T）,；82（机型：H30）,；83（机型：H30T） | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateFilePath | 照片文件路径 | 字符串 | - | 照片文件名 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateFileMD5 | 照片文件MD5 | 字符串 | - | 照片文件MD5值 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateFileSize | 照片文件大小 | 整型 | Byte | 照片文件实际大小 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateFileSuffix | 照片文件后缀 | 字符串 | - | 为生成媒体文件命名时将额外附带该后缀。 | 必需元素 | M300 RTK，M350 RTK；M30/M30T |
| wpml:accurateCameraApertue | 光圈大小 | 整型 | - | *注：该值为真实光圈x100 | 必需元素 | M30/M30T |
| wpml:accurateCameraLuminance | 环境亮度 | 整型 | - | - | 必需元素 | M30/M30T |
| wpml:accurateCameraShutterTime | 快门时间 | 浮点型 | 秒 | - | 必需元素 | M30/M30T |
| wpml:accurateCameraISO | ISO | 整型 | - | - | 必需元素 | M30/M30T |

#### orientedShoot

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:gimbalPitchRotateAngle | 云台Pitch转动角度 | 浮点型 | ° | M30/M30T：[-120, 45]；M3E/M3T：[-90, 35]；M3D/M3TD，M4D/M4TD，M4E/M4T：[-90, 30]； | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalYawRotateAngle | 云台Yaw转动角度 | 浮点型 | ° | ；*注：M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T 机型 wpml:gimbalYawRotateAngle 与 wpml:aircraftHeading 需保持一致 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusX | 目标选中框中心水平坐标 | 整型 | px | （0， 960）；*注：照片左上角为坐标原点，水平方向为X轴，竖直方向为Y轴 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusY | 目标选中框中心竖直坐标 | 整型 | px | （0，720）；*注：照片左上角为坐标原点，水平方向为X轴，竖直方向为Y轴 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusRegionWidth | 目标选中框宽 | 整型 | px | (0, 960) | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focusRegionHeight | 目标选中框高 | 整型 | px | (0, 720) | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:focalLength | 变焦焦距 | 浮点型 | mm | > 0 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:aircraftHeading | 飞行器目标偏航角（相对于地理北） | 浮点型 | ° | ；*注：飞行器旋转至该目标偏航角。0°为正北方向，90°为正东方向，-90°为正西方向，-180°/180°为正南方向；*注：M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T 机型 wpml:gimbalYawRotateAngle 与 wpml:aircraftHeading 需保持一致 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:accurateFrameValid | 是否框选精准复拍目标 | 布尔型 | - | 1: 已框选目标物；0: 未框选目标物；*注：该值设置为1，复拍时飞行器会自主寻找目标进行拍摄。该值设置为0，复拍时飞行器只会按照飞行器姿态和负载姿态进行动作重复，不会自主寻找目标 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:payloadLensIndex | 拍摄照片存储类型 | - | 枚举-string（列表） | zoom: 存储变焦镜头拍摄照片；wide: 存储广角镜头拍摄照片；ir: 存储红外镜头拍摄照片；visable：可见光照片；*注：存储多个镜头照片，格式如“`<wpml:payloadLensIndex>wide,ir</wpml:payloadLensIndex>`”表示同时使用广角、红外镜头 | 必需元素 | M30/M30T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:useGlobalPayloadLensIndex | 是否使用全局存储类型 | 布尔型 | - | 0：不使用全局设置；1：使用全局设置 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:targetAngle | 目标框角度 | 浮点型 | ° | ；*注：目标框的旋转角度(以Y轴为基准，顺时针旋转) | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:actionUUID | 动作唯一标识 | - | - | *注：拍照时，该值将被写入照片文件中，用于关联动作和照片文件 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:imageWidth | 照片宽度 | 整型 | px | 960 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:imageHeight | 照片高度 | 整型 | px | 720 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:AFPos | AF电机位置 | 整型 | - | - | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:gimbalPort | 云台端口号 | 整型 | - | 拍摄照片的相机安装位置；*注：M30/M30T机型该值固定为0 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedCameraType | 相机类型 | 整型 | - | 52（机型：M30双光相机）,；53（机型：M30T三光相机）；66（机型：Mavic 3E 相机）；67（机型：Mavic 3T 相机）；80（机型：Matrice 3D 相机）；81（机型：Matrice 3TD 相机） | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedFilePath | 照片文件路径 | 字符串 | - | 照片文件名 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedFileMD5 | 照片文件MD5 | 字符串 | - | 照片文件MD5值 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedFileSize | 照片文件大小 | 整型 | Byte | 照片文件实际大小 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedFileSuffix | 照片文件后缀 | 字符串 | - | 为生成媒体文件命名时将额外附带该后缀。 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedCameraApertue | 光圈大小 | 整型 | - | *注：该值为真实光圈x100 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedCameraLuminance | 环境亮度 | 整型 | - | - | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedCameraShutterTime | 快门时间 | 浮点型 | 秒 | - | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedCameraISO | ISO | 整型 | - | - | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |
| wpml:orientedPhotoMode | 拍照模式 | 枚举-string | - | normalPhoto: 普通拍照；lowLightSmartShooting：智能低光拍照 | 必需元素 | M30/M30T，M3E/M3T，M3D/M3TD，M4D/M4TD，M4E/M4T |

#### panoShot

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整型 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 必需元素 | M30/M30T |
| wpml:payloadLensIndex | 拍摄照片存储类型 | 图片格式列表 | 枚举-string（列表） | zoom: 存储变焦镜头拍摄照片；wide: 存储广角镜头拍摄照片；ir: 存储红外镜头拍摄照片；narrow_band: 存储窄带镜头拍摄照片；visable：可见光照片；注：存储多个镜头照片，格式如“`<wpml:payloadLensIndex>wide,ir,narrow_band</wpml:payloadLensIndex>`”表示同时使用广角、红外和窄带镜头 | 必需元素 | M30/M30T |
| wpml:useGlobalPayloadLensIndex | 是否使用全局存储类型 | 布尔型 | - | 0：不使用全局设置；1：使用全局设置 | 必需元素 | M30/M30T |
| wpml:panoShotSubMode | 全景拍照模式 | 字符串 | - | panoShot_360：全景模式 | 必需元素 | M30/M30T、M3D/M3TD，M4D/M4TD，M4E/M4T |

#### recordPointCloud

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整形 | - | 负载挂载位置枚举值请参考[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html)页面中的`相机枚举值`中`type-subtype-gimbalindex`中的`gimbalindex`字段 | 是 | M300 RTK，M350 RTK |
| wpml:recordPointCloudOperate | 点云操作 | 字符串 | - | startRecord：开始点云录制；pauseRecord：暂停点云录制；resumeRecord：继续点云录制；stopRecord：结束点云录制 | 是 | M300 RTK，M350 RTK |

#### megaphone

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整形 | - | 0：飞行器1号挂载位置，对应主云台 | 是 | M4D/M4TD |
| wpml:actionUUID | 动作唯一标识 | 字符串 | - | - | 是 | M4D/M4TD |
| wpml:megaphoneOperateType | 喊话动作开关 | 整形 | - | 0：开始喊话 ；1：结束喊话 ； | 是 | M4D/M4TD |
| wpml:megaphoneOperateVolume | 喊话动作音量 | 整形 | - | 音量大小，值范围 0-100 | 是 | M4D/M4TD |
| wpml:megaphoneOperateLoop | 是否单曲循环播放 | 布尔形 | - | 0：关闭 ；1：开启 ； | 是 | M4D/M4TD |
| wpml:megaphoneOperateFilePath | 喊话音频文件在kmz中对应的路径 | 字符串 | - | 音频文件在kmz中对应的路径，如：/wpmz/res/audio/71b4cf0504a7b899.opus | 是 | M4D/M4TD |
| wpml:megaphoneFileName | 喊话音频文件对应的名称 | 字符串 | - | 音频文件在kmz中对应的名称，如：71b4cf0504a7b899.opus | 是 | M4D/M4TD |
| wpml:megaphoneFileOriginalName | 喊话音频文件播放时显示的名字 | 字符串 | - | 音频文件播放时，喊话器回传的名称，如：喊话器音频.mp3 | 是 | M4D/M4TD |
| wpml:megaphoneFileMd5 | 喊话音频文件的md5值 | 字符串 | - | 喊话音频文件的md5值 | 是 | M4D/M4TD |
| wpml:megaphoneFileBitrate | 喊话音频文件的压缩比特率 | 整形 | - | 1: 比特率为8000 ； 2: 比特率为16000 ； 3: 比特率为24000 ； 4: 比特率为32000 ； 5: 比特率为48000 ； 6: 比特率为64000 ； ； 注：当前仅支持4，比特率为32000 | 是 | M4D/M4TD ｜ |

#### searchlight

| 元素 | 名称 | 类型 | 单位 | 取值与释义 | 是否必需（默认值） | 支持机型 |
| --- | --- | --- | --- | --- | --- | --- |
| wpml:payloadPositionIndex | 负载挂载位置 | 整形 | - | 0：飞行器1号挂载位置，对应主云台 | 是 | M4D/M4TD |
| wpml:actionUUID | 动作唯一标识 | 字符串 | - | - | 否 | M4D/M4TD |
| wpml:searchlightOperateType | 探照灯操作类型 | 整形 | - | 0：关灯 ； 1：照明 ； 2：爆闪 ； | 是 | M4D/M4TD |
| wpml:searchlightBrightness | 亮度 | 整形 | - | 亮度，值范围 0-100 | 是 | M4D/M4TD |
