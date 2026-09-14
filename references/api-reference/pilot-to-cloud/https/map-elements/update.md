---
title: "更新地图元素"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/map-elements/update.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 更新元素

`PUT /map/api/v1/workspaces/{workspace_id}/elements/{id}`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| id | path | string | true | element id |
| x-auth-token | header | string | true | 访问令牌 |
| body | body | [map.ElementUpdateInput](#schemamap.elementupdateinput) | true | body |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [map.SwagUUIDResp](#schemamap.swaguuidresp) |

> Example responses

```
{
	"code":0,
   	"data":{
    	"id":"94c51c50-f111-45e8-ac8c-4f96c93ced44"
    },
    "message": "success"
}
```

# Schemas

## map.ElementUpdateInput

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
  "name": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| content | [map.Content](#schemamap.content) | false | none | 资源内容对象 |
| name | string | false | none | 元素名称 |

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
| » color | string | false | 支持的元素颜色；* BLUE：0x2D8CF0；* GREEN - 0x19BE6B；；* YELLOW - 0xFFBB00；；* ORANGE - 0xB620E0；；* RED - 0xE23C39；* PURPLE - 0x212121 |  |
| type | string | false | none | geojson属性 |

## map.SwagUUIDResp

```
{
  "code": 0,
  "data": {
    "id": "string"
  },
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | true | none | 错误码 |
| data | [map.UUIDResp](#schemamap.uuidresp) | true | none | none |
| message | string | true | none | 错误描述 |

## map.UUIDResp

```
{
  "id": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| id | string | true | none | 元素id |
