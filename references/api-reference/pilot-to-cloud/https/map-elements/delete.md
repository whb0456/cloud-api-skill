---
title: "删除地图元素"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/map-elements/delete.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 删除元素

`DELETE /map/api/v1/workspaces/{workspace_id}/elements/{id}`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| id | path | integer | true | 元素id |
| workspace_id | path | string | true | 工作空间id |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [map.SwagUUIDResp](#schemamap.swaguuidresp) |

> Example responses

```
{
	"code":0
   	"data":{
    	"id":"94c51c50-f111-45e8-ac8c-4f96c93ced44"
    },
    "message": "success"
}
```

# Schemas

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
