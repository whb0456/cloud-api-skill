---
title: "产品支持"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 机型支持

> **注意：**
>
> - 上云 API 暂不支持 M200 V2 系列、M200 系列、M2E、P4R、M2EA 等老机型。
> - 如果需要机型的详细信息，可以在大疆官网，搜索对应的机型名称查看，譬如[大疆机场](https://www.dji.com/cn/dock)。

## 格式说明

- 通过 `domain`、`type`、`sub_type` 可以唯一地确定一款设备（可以为飞行器、负载、遥控器等）。
- 通过 `type`、`sub_type`、`gimbalindex` 可以唯一地确定一款负载，它挂载于哪款飞行器的哪个云台口。其中 `gimbalindex`
  - 0，对于 M300 RTK 机型为视线随机头朝前，机身下方左云台。对于其他机型，对应主云台。
  - 1，对于 M300 RTK 机型为视线随机头朝前，机身下方右云台。
  - 2，对于 M300 RTK 机型为机身上方云台。
  - 7，指 FPV 相机。
  - 其他数值为预留枚举值，不必关注。
- `domain` 表示一个领域，作为一个命名空间，暂时分为：
  - 0，飞机类
  - 1，负载类
  - 2，遥控器类
  - 3，机场类
- `name` 为云平台、SDK 共用名称。

|  |  |  |  |
| --- | --- | --- | --- |
| 飞行平台；（附官网链接） | 网关设备 | 负载 | 备注 |
| Matrice 4D/Matrice 4TD | 大疆机场 3 | -- | 三方负载暂时不支持； 机型在后续文档中，简称：M4D/M4TD |
| [Matrice 3D/Matrice 3TD](https://enterprise.dji.com/dock-2) | [大疆机场 2](https://enterprise.dji.com/dock-2) | -- | 三方负载暂时不支持； 机型在后续文档中，简称：M3D/M3TD |
| [Matrice 400](https://www.dji.com/matrice-400) | DJI RC Plus 2+ DJI Pilot 2 | H30/H30T | 三方负载暂时不支持 |
| [Matrice 350 RTK](https://enterprise.dji.com/cn/matrice-350-rtk) | DJI RC Plus+ DJI Pilot 2 | H20/H20T；H20N；H30/H30T | 三方负载暂时不支持 ； 机型在后续文档中，简称：M350 RTK |
| [Matrice 300 RTK](https://www.dji.com/matrice-300) | DJI RC Plus+ DJI Pilot 2 | H20/H20T；H20N；H30/H30T | 三方负载暂时不支持 ； 机型在后续文档中，简称：M300 RTK |
| [Matrice 300 RTK](https://www.dji.com/matrice-300) | DJI 带屏遥控器行业版 + DJI Pilot 2 | H20/H20T；H20N；H30/H30T | 三方负载暂时不支持 |
| [Matrice 30/Matrice 30T](https://www.dji.com/matrice-30) | DJI RC Plus + DJI Pilot 2 | -- | 三方负载暂时不支持 ； 机型在后续文档中，简称：Matrice 30/30T |
| [Matrice 30/Matrice 30T](https://www.dji.com/matrice-30) | [大疆机场](https://www.dji.com/dock) | -- | 三方负载暂时不支持 |
| [DJI Matrice 4E/DJI Matrice 4T](https://www.dji.com/matrice-4) | DJI RC Plus 2 + DJI Pilot 2 | -- | 三方负载暂时不支持 ； 机型在后续文档中，简称：DJI Matrice 4E/4T |
| [DJI Mavic 3 行业系列](https://www.dji.com/mavic-3-enterprise) | DJI RC Pro + DJI Pilot 2 | -- | 三方负载暂时不支持 ； 机型在后续文档中；DJI Mavic 3 行业系列简称：Mavic 3E/3T |

## 飞行器/遥控器/机场枚举值

| 产品名称(name) | 领域（domain） | 主类型（type） | 子类型（sub_type） | 说明 |
| --- | --- | --- | --- | --- |
| Matrice 400 | 0 | 103 | 0 | - |
| Matrice 350 RTK | 0 | 89 | 0 | - |
| Matrice 300 RTK | 0 | 60 | 0 | - |
| Matrice 30 | 0 | 67 | 0 | - |
| Matrice 30T | 0 | 67 | 1 | - |
| Mavic 3 行业系列（M3E 相机） | 0 | 77 | 0 | - |
| Mavic 3 行业系列（M3T 相机） | 0 | 77 | 1 | - |
| Mavic 3 行业系列（M3TA 相机） | 0 | 77 | 3 | - |
| Matrice 3D | 0 | 91 | 0 | - |
| Matrice 3TD | 0 | 91 | 1 | - |
| Matrice 4D | 0 | 100 | 0 | - |
| Matrice 4TD | 0 | 100 | 1 | - |
| DJI Matrice 4 系列（M4E 相机） | 0 | 99 | 0 | - |
| DJI Matrice 4 系列（M4T 相机） | 0 | 99 | 1 | - |
| DJI 带屏遥控器行业版 | 2 | 56 | 0 | 搭配 Matrice 300 RTK |
| DJI RC Plus | 2 | 119 | 0 | 搭配 ；Matrice 350 RTK；Matrice 300 RTK；Matrice 30/30T |
| DJI RC Plus 2 | 2 | 174 | 0 | 搭配 ；>DJI Matrice 4 系列 |
| DJI RC Pro 行业版 | 2 | 144 | 0 | 搭配 ；Mavic 3 行业系列 |
| 大疆机场 | 3 | 1 | 0 | - |
| 大疆机场 2 | 3 | 2 | 0 | - |
| 大疆机场 3 | 3 | 3 | 0 | - |

## 相机枚举值

| 产品类型 | 相机名称 | 领域(domain) | type-subtype-gimbalindex | 说明 |
| --- | --- | --- | --- | --- |
| 飞行器 FPV | Matrice 300 RTK  FPV | 1 | 39-0-7 | - |
| Matrice 350 RTK FPV | 1 | 39-0-7 | - |
| Matrice 30 FPV | 1 | 39-0-7 | - |
| Matrice 30T FPV | 1 | 39-0-7 | - |
| Matrice 400 FPV | 1 | 39-0-7 | - |
| Matrice 3D 辅助影像 | 1 | 176-0-0 | - |
| Matrice 3TD 辅助影像 | 1 | 176-0-0 | - |
| Matrice 4D 辅助影像 | 1 | 176-0-0 | - |
| Matrice 4TD 辅助影像 | 1 | 176-0-0 | - |
| 相机 | 禅思 Z30 | 1 | 位于飞行器；左舷侧（主云台）：20-0-0；右舷侧：20-0-1；上侧：20-0-2 | - |
| 禅思 XT2 | 1 | 位于飞行器；左舷侧（主云台）：26-0-0；右舷侧：26-0-1；上侧：26-0-2 | - |
| 禅思 XTS | 1 | 位于飞行器；左舷侧（主云台）：41-0-0；右舷侧：41-0-1；上侧：41-0-2 | - |
| 禅思 H20 | 1 | 位于飞行器；左舷侧（主云台）：42-0-0；右舷侧：42-0-1；上侧：42-0-2 | - |
| 禅思 H20T | 1 | 位于飞行器；左舷侧（主云台）：43-0-0；右舷侧：43-0-1；上侧：43-0-2 | - |
| 禅思 H20N | 1 | 位于飞行器；左舷侧（主云台）：61-0-0；右舷侧：61-0-1；上侧：61-0-2 | - |
| 禅思 H30 | 1 | 位于飞行器；左舷侧（主云台）：82-0-0；右舷侧：82-0-1；上侧：82-0-2 | - |
| 禅思 H30T | 1 | 位于飞行器；左舷侧（主云台）：83-0-0；右舷侧：83-0-1；上侧：83-0-2 | - |
| Matrice 30 Camera | 1 | 位于飞行器；主云台：52-0-0 | - |
| Matrice 30T Camera | 1 | 位于飞行器；主云台：53-0-0 | - |
| DJI Matrice 4E Camera | 1 | 位于飞行器；主云台：88-0-0 | - |
| DJI Matrice 4T Camera | 1 | 位于飞行器；主云台：89-0-0 | - |
| Mavic 3E Camera | 1 | 位于飞行器；主云台：66-0-0 | - |
| Mavic 3T Camera | 1 | 位于飞行器；主云台：67-0-0 | - |
| Mavic 3TA Camera | 1 | 位于飞行器；主云台：129-0-0 | - |
| Matrice 3D Camera | 1 | 位于飞行器；主云台：80-0-0 | - |
| Matrice 3TD Camera | 1 | 位于飞行器；主云台：81-0-0 | - |
| Matrice 4D Camera | 1 | 位于飞行器；主云台：98-0-0 | - |
| Matrice 4TD Camera | 1 | 位于飞行器；主云台：99-0-0 | - |
| 机场相机 | DJI Dock 舱外相机 | 1 | 165-0-7 | 大疆机场；camera_position: 1 |
| DJI Dock 2 舱内相机 | 1 | 165-0-7 | 大疆机场 2；camera_position: 0 |
| DJI Dock 2 舱外相机 | 1 | 165-0-7 | 大疆机场 2；camera_position: 1 |
| DJI Dock 3 舱内相机 | 1 | 165-0-7 | 大疆机场 3；camera_position: 0 |
| DJI Dock 3 舱外相机 | 1 | 165-0-7 | 大疆机场 3；camera_position: 1 |

> **说明：** `camera_position` 是直播相机切换 API （Method: live_camera_change）的参数。
