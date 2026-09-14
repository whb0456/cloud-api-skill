---
title: "获取重复的航线文件名称"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/get-duplicated-waypointfile-name.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取重复的航线文件名称

`GET /wayline/api/v1/workspaces/:workspace_id/waylines/duplicate-names`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| name | query | array[string] | true | 文件名称集合 |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.GetDuplicateNamesOutput](#schemawayline.getduplicatenamesoutput) |

> Example

```
{
    "code": 0,
    "message": "string",
    "data": ["name1", "name2"]
}
```

# Schemas

## wayline.GetDuplicateNamesOutput

```
{
  "code": 0,
  "data": [
    "string"
  ],
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | array[string] | false | none | 重复的文件名数组 |
| message | string | false | none | 错误描述 |
