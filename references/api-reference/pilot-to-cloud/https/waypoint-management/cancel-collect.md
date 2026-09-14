---
title: "批量取消收藏航线文件"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/cancel-collect.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 批量取消收藏航线文件

`DELETE /wayline/api/v1/workspaces/{workspace_id}/favorites`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| id | query | array[string] | false | 航线文件id集合 |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.BaseResponse](#schemawayline.baseresponse) |

> Example responses

```
{
	"code":0
   	"data":{},
    "message": "success"
}
```

# Schemas

## wayline.BaseResponse

```
{
  "code": 0,
  "data": null,
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | any | false | none | none |
| message | string | false | none | 错误描述 |

`DELETE /wayline/api/v1/workspaces/{workspace_id}/favorites`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| id | query | array[string] | false | 航线文件id集合 |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.BaseResponse](#schemawayline.baseresponse) |

> Example responses

```
{
	"code":0
   	"data":{},
    "message": "success"
}
```
