---
title: "批量收藏航线文件"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/collect-waypointfile-in-batch.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 批量收藏航线文件

`POST /wayline/api/v1/workspaces/{workspace_id}/favorites`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间 ID |
| x-auth-token | header | string | true | 访问令牌 |
| id | path | Array | true | 航线文件 ID |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.CreateFavoriteOutput](#schema_wayline.CreateFavoriteOutput) |

> Example responses

```
{
	"code":0,
   	"data":{},
    "message": "success"
}
```

# Schemas

## wayline.CreateFavoriteOutput

```
{
  "code": 0,
  "data": {
    "id": [
      "string"
    ]
  },
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | [wayline.CreateFavoriteInput](#schemawayline.createfavoriteinput) | false | none | none |
| message | string | false | none | 错误描述 |
