---
title: "获取设备拓扑"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/situation-awareness/obtain-device-topology-list.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取设备拓扑列表

PILOT在首次上线后，会发送http请求去获取同一个工作空间下的所有设备列表及其拓扑，服务端需要把整个设备列表发给PILOT。同时，当接收到websocket指令通知设备online/offline/update的时候，也是需要调用该接口进行请求设备拓扑列表进行更新。

`GET /manage/api/v1/workspaces/{workspace_id}/devices/topologies`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id（在同一个空间下的所有设备都可以互相共享设备拓扑及遥感信息） |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [tsa.GetWebPrjDeviceForOpenPlatformRsp](#schematsa.getwebprjdeviceforopenplatformrsp) |

> Example responses

```
{
	"code": 0,
	"message": "success",
	"data": {
		"list": [{
			"hosts": [{
				"sn": "drone01",
				"device_model": {
					"key": "0-60-0",
					"domain": "0",
					"type": "60",
					"sub_type": "0"
				},
				"online_status": true,
				"device_callsign": "救援飞机",
				"user_id": "string",
				"user_callsign": "string",
				"icon_urls": {
					"normal_icon_url": "resource://pilot/drawable/tsa_aircraft_others_normal",
					"selected_icon_url": "resource://pilot/drawable/tsa_aircraft_others_pressed"
				}
			}],
			"parents": [{
				"sn": "rc02",
				"online_status": true,
				"device_model": {
					"key": "2-56-0",
					"domain": "2",
					"type": "56",
					"sub_type": "0"
				},
				"device_callsign": "遥控器D",
				"user_id": "string",
				"user_callsign": "string",
				"icon_urls": {
					"normal_icon_url": "resource://pilot/drawable/tsa_aircraft_others_normal",
					"selected_icon_url": "resource://pilot/drawable/tsa_aircraft_others_pressed"
				}
			}]
		}]
	}
}
```

# Schemas

## tsa.GetWebPrjDeviceForOpenPlatformRsp

```
{
    "code":0,
    "message":"success",
    "data":{
        "list":[
            {
                "hosts":[
                    {
                        "device_callsign":"string",
                        "device_model":{
                            "key":"string",
                            "domain":"string",
                            "type":"string",
                            "sub_type":"string"
                        },
                        "icon_urls":{
                            "normal_icon_url":"string",
                            "selected_icon_url":"string"
                        },
                        "online_status":true,
                        "sn":"string",
                        "user_callsign":"string",
                        "user_id":"string"
                    }
                ],
                "parents":[
                    {
                        "device_callsign":"string",
                        "device_model":{
                            "key":"string",
                            "domain":"string",
                            "type":"string",
                            "sub_type":"string"
                        },
                        "icon_urls":{
                            "normal_icon_url":"string",
                            "selected_icon_url":"string"
                        },
                        "online_status":true,
                        "sn":"string",
                        "user_callsign":"string",
                        "user_id":"string"
                    }
                ]
            }
        ]
    }
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| list | [[tsa.DeviceTopoRsp](#schematsa.devicetoporsp)] | false | none | none |

## tsa.DeviceTopoRsp

```
{
  "hosts": [
    {
      "device_callsign": "string",
      "device_model": {
        "key":"string",
        "domain":"string",
        "type":"string",
        "sub_type":"string"
      },
      "icon_urls": {
        "normal_icon_url": "string",
        "selected_icon_url": "string"
      },
      "online_status": true,
      "sn": "string",
      "user_callsign": "string",
      "user_id": "string"
    }
  ],
  "parents": [
    {
      "device_callsign": "string",
       "device_model": {
         "key":"string",
         "domain":"string",
         "type":"string",
         "sub_type":"string"
       },
      "icon_urls": {
        "normal_icon_url": "string",
        "selected_icon_url": "string"
      },
      "online_status": true,
      "sn": "string",
      "user_callsign": "string",
      "user_id": "string"
    }
  ]
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| hosts | [[tsa.TopoHostDeviceRsp](#schematsa.topohostdevicersp)] | false | none | 飞机设备拓扑集合 |
| parents | [[tsa.TopoGatewayDeviceRsp](#schematsa.topogatewaydevicersp)] | false | none | 网关设备拓扑集合 |

## tsa.TopoGatewayDeviceRsp

```
{
  "device_callsign": "string",
  "device_model": {
    "key":"string",
    "domain":"string",
    "type":"string",
    "sub_type":"string"
  },
   "icon_urls": {
    "normal_icon_url": "string",
    "selected_icon_url": "string"
  },
  "online_status": true,
  "sn": "string",
  "user_callsign": "string",
  "user_id": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| device_callsign | string | false | none | 设备呼号 |
| device_model | [tsa.DeviceModelEnum](#schematsa.devicemodelenum) | false | none | 设备枚举值结构体 |
| icon_urls | object | false | none | 自定义图标，如果为空，则按device_model 类型自动加载。如果不为空，则按该配置来显示图片 |
| » normal_icon_url | string | false | none | 常规状态下的icon |
| » selected_icon_url | string | false | none | 选中状态下的icon |
| online_status | boolean | false | none | 设备在线状态 |
| sn | string | false | none | 设备序列号 |
| user_callsign | string | false | none | 用户呼号 |
| user_id | string | false | none | 用户id |

## tsa.TopoHostDeviceRsp

```
{
  "device_callsign": "string",
  "device_model": {
    "key":"string",
    "domain":"string",
    "type":"string",
    "sub_type":"string"
  },
  "icon_urls": {
    "normal_icon_url": "string",
    "selected_icon_url": "string"
  },
  "online_status": true,
  "sn": "string",
  "user_callsign": "string",
  "user_id": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| device_callsign | string | false | none | 设备呼号 |
| device_model | [tsa.DeviceModelEnum](#schematsa.devicemodelenum) | false | none | 设备枚举值结构体 |
| icon_urls | object | false | none | 自定义图标，如果为空，则按device_model 类型自动加载。如果不为空，则按该配置来显示图片 |
| » normal_icon_url | string | false | none | 常规状态下的icon |
| » selected_icon_url | string | false | none | 选中状态下的icon |
| online_status | boolean | false | none | 设备在线状态 |
| sn | string | false | none | 设备序列号 |
| user_callsign | string | false | none | 用户呼号 |
| user_id | string | false | none | 用户id |

## tsa.DeviceModelEnum

```
{
  "domain": "string",
  "key": "string",
  "sub_type": "string",
  "type": "text"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| domain | string | false | none | 产品枚举值类型 |
| key | string | false | none | 产品枚举值主键ID |
| sub_type | string | false | none | 产品枚举值子型号 |
| type | string | false | none | 产品枚举值主型号 |
