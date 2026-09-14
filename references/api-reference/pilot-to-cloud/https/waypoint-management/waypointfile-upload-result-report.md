---
title: "航线文件上传结果上报"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/waypointfile-upload-result-report.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 上报航线文件上传结果

`POST /wayline/api/v1/workspaces/{workspace_id}/upload-callback`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| x-auth-token | header | string | true | 访问令牌 |
| body | body | [wayline.UploadCallbackInput](#schemawayline.uploadcallbackinput) | true | body 参数 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.BaseResponse](#schemawayline.baseresponse) |

> Example responses

```
{
	"code":0
   	"data": {},
    "message": "success"
}
```

# Schemas

## wayline.UploadCallbackInput

```
{
  "metadata": {
    "drone_model_key": "string",
    "payload_model_keys": [
      "string"
    ],
    "template_types": [
      0
    ]
  },
  "name": "string",
  "object_key": "string",
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| metadata | [wayline.Metadata](#schemawayline.metadata) | false | none | 航线文件元数据 |
| name | string | false | none | 文件名称 |
| object_key | string | true | none | 文件在对象存储桶的key |

## wayline.Metadata

```
{
  "drone_model_key": "string",
  "payload_model_keys": [
    "string"
  ],
  "template_types": [
    0
  ]
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| drone_model_key | string | false | none | 飞机产品枚举值 |
| payload_model_keys | [string] | false | none | 负载产品枚举值 |
| template_types | [integer] | false | none | 航线模版类型集合 |
