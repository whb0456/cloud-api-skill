---
title: "获取地图元素"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/map-elements/obtain.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取元素列表

PILOT在首次上线后，会发送http请求去获取地图元素列表，服务端需要把共享的地图元素列表发给PILOT。同时，当接收到websocket指令进行图层刷新的时候，也是需要调用该接口进行请求地图元素列表。

注意：列表里需要有App共享图层，否则后继元素修改将无法同步到服务器。 `GET /map/api/v1/workspaces/{workspace_id}/element-groups`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| group_id | query | string | false | 元素组id（同一个元素组下可以包含多个地图元素，相当于给地图元素进行分组。在发起请求时，如果不带group_id参数，则服务端会把所有地图元素全部返回，如果指定了group_id，则只会返回指定的元素组内的元素集合） |
| is_distributed | query | boolean | false | 元素组分发状态（默认为true） |
| workspace_id | path | string | true | 工作空间id |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [map.SwagTree](#schemamap.swagtree) |

> Example responses

```
{
    "code":0,
    "message":"success",
    "data":[
        {
            "id":"d275c4e1-d864-4736-8b5d-5f5882ee9bdd",
            "type":1,
            "name":"string",
            "is_lock":false,
            "create_time":1637158501230,
            "elements":[
                {
                    "id":"6d5da7b4-ac39-42bf-9580-4c8a94c11989",
                    "name":"string",
                    "create_time":1637158501230,
                    "update_time":1637158501230,
                    "resource":{
                        "type":0,
                        "user_name":"name",
                        "content":{
                            "type":"Feature",
                            "properties":{
                                "color":"#0091FF",
                                "clampToGround":false
                            },
                            "geometry":{
                                "type":"Point",
                                "coordinates":[
                                    -112.49344909640939,
                                    48.18734850103778,
                                    40.2
                                ]
                            }
                        }
                    }
                },
                {
                    "id":"6d5da7b4-ac39-42bf-9580-4c8a94c11988",
                    "name":"string",
                    "create_time":1637158501230,
                    "update_time":1637158501230,
                    "resource":{
                        "type":1,
                        "user_name":"string",
                        "content":{
                            "type":"Feature",
                            "properties":{
                                "color":"#0091FF",
                                "clampToGround":false
                            },
                            "geometry":{
                                "type":"LineString",
                                "coordinates":[
                                    [
                                        -112.49344909640939,
                                        48.18734850103778
                                    ],
                                    [
                                        -104.47267952618783,
                                        46.60029335386577
                                    ],
                                    [
                                        -109.20285386177949,
                                        42.63945392538244
                                    ],
                                    [
                                        -113.51847222524307,
                                        43.059268439796575
                                    ]
                                ]
                            }
                        }
                    }
                },
                {
                    "id":"6d5da7b4-ac39-42bf-9580-4c8a94c11987",
                    "name":"string",
                    "create_time":1637158501230,
                    "update_time":1637158501230,
                    "resource":{
                        "type":2,
                        "user_name":"string",
                        "content":{
                            "type":"Feature",
                            "properties":{
                                "color":"#0091FF",
                                "clampToGround":false
                            },
                            "geometry":{
                                "type":"Polygon",
                                "coordinates":[
                                    [
                                        [
                                            -112.49344909640939,
                                            48.18734850103778
                                        ],
                                        [
                                            -104.47267952618783,
                                            46.60029335386577
                                        ],
                                        [
                                            -109.20285386177949,
                                            42.63945392538244
                                        ],
                                        [
                                            -113.51847222524307,
                                            43.059268439796575
                                        ]
                                    ]
                                ]
                            }
                        }
                    }
                }
            ]
        }
    ]
}
```

# Schemas

## map.SwagTree

```
{
  "code": 0,
  "data": [
    {
      "create_time": 0,
      "elements": [
        {
          "create_time": 0,
          "id": "string",
          "name": "string",
          "resource": {
            "content": {
              "geometry": {
                "coordinates": [
                  null
                ],
                "type": "text"
              },
              "properties": {
                "clampToGround": true,
                "color": "string"
              },
              "type": "text"
            },
            "type": 0
          },
          "update_time": 0
        }
      ],
      "id": "string",
      "is_lock": true,
      "name": "string",
      "type": 0
    }
  ],
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | [[map.ElementGroupOutput](#schemamap.elementgroupoutput)] | false | none | none |
| message | string | false | none | 错误描述 |

## map.ElementGroupOutput

```
{
  "create_time": 0,
  "elements": [
    {
      "create_time": 0,
      "id": "string",
      "name": "string",
      "resource": {
        "content": {
          "geometry": {
            "coordinates": [
              null
            ],
            "type": "text"
          },
          "properties": {
            "clampToGround": true,
            "color": "string"
          },
          "type": "text"
        },
        "type": 0
      },
      "update_time": 0
    }
  ],
  "id": "string",
  "is_lock": true,
  "name": "string",
  "type": 0
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| create_time | integer | false | none | 元素组创建时间（毫秒） |
| elements | [[map.ElementItem](#schemamap.elementitem)] | false | none | 元素集合 |
| id | string | false | none | 元素组id |
| is_lock | boolean | false | none | 是否锁定 (若锁定，则该元素组下的元素不可进行删除和修改) |
| name | string | false | none | 元素组名称 |
| type | integer | false | none | 元素组类型；* 0 - 自定义元素组；* 1 - 默认元素组；* 2 - App 共享元素组（type=2 时是 App 共享元素组，Pilot 默认会往这个元素组增加地图） |

## map.ElementItem

```
{
  "create_time": 0,
  "id": "string",
  "name": "string",
  "resource": {
    "content": {
      "geometry": {
        "coordinates": [
          null
        ],
        "type": "text"
      },
      "properties": {
        "clampToGround": true,
        "color": "string"
      },
      "type": "text"
    },
    "type": 0
  },
  "update_time": 0
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| create_time | integer | false | none | 元素创建时间（毫秒） |
| id | string | false | none | 元素id |
| name | string | false | none | 元素名称 |
| resource | [map.ResourceItem](#schemamap.resourceitem) | false | none | 资源对象 |
| update_time | integer | false | none | 元素更新时间（毫秒） |

## map.ResourceItem

```
{
  "content": {
    "geometry": {
      "coordinates": [
        null
      ],
      "type": "text"
    },
    "properties": {
      "clampToGround": true,
      "color": "string"
    },
    "type": "text"
  },
  "type": 0
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| content | [map.Content](#schemamap.content) | false | none | 资源内容对象 |
| type | integer | false | none | 资源类型；* 0 - pin点；* 1 - 线；* 2 - 面 |

## map.Content

```
{
  "geometry": {
    "coordinates": [
      null
    ],
    "type": "text"
  },
  "properties": {
    "clampToGround": true,
    "is3d": false,
    "color": "string"
  },
  "type": "text"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| geometry | object | false | none | geojson属性 |
| » coordinates | [any] | false | none | geojson属性 |
| » type | string | false | none | geojson属性 |
| properties | object | false | none | geojson属性 |
| » clampToGround | boolean | false | none | 是否贴地 |
| » is3d | boolean | false | none | 是否为空间线面 |
| » color | string | false | none | 支持的元素颜色；* BLUE：0x2D8CF0；* GREEN - 0x19BE6B；；* YELLOW - 0xFFBB00；；* ORANGE - 0xB620E0；；* RED - 0xE23C39；* PURPLE - 0x212121 |
| type | string | false | none | geojson属性 |
