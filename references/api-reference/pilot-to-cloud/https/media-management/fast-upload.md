---
title: "文件快传"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/media-management/fast-upload.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 文件快传

`POST /media/api/v1/workspaces/{workspace_id}/fast-upload`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| x-auth-token | header | string | true | 访问令牌 |
| body | body | [media.FastUploadInput](#schemamedia.fastuploadinput) | true | body |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [media.FastUploadOutput](#tocS_media.FastUploadOutput) |

> Example responses

```
{
	"code":0,
    "message":"success",
   	"data":{}
}
```

# Schemas

## media.FastUploadInput

```
{
  "ext": {
    "drone_model_key": "string",
    "is_original": true,
    "payload_model_key": "string",
    "tinny_fingerprint": "string",
    "sn": "string"
  },
  "fingerprint": "string",
  "name": "string",
  "path": "string"
}
```

### Properties

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| ext | [media.MediaFile](#schemamedia.mediafile) | false | none | 文件关联的扩展属性 |
| fingerprint | string | true | none | 文件指纹 |
| name | string | false | none | 文件的名称 |
| path | string | false | none | 文件的业务路径 |

## media.MediaFile

```
{
  "drone_model_key": "string",
  "is_original": true,
  "payload_model_key": "string",
  "tinny_fingerprint": "string",
  "sn": "string"
}
```

### Properties

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| drone_model_key | string | false | none | 飞机产品枚举值 |
| is_original | boolean | false | none | 是否为原图 |
| payload_model_key | string | false | none | 负载产品枚举值 |
| tinny_fingerprint | string | false | none | 精简指纹 |
| sn | string | false | none | 设备序列号 |

## media.FastUploadOutput

```
{
    "code":0,
    "message":"success",
    "data":{}
}
```

### Properties

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | string | false | none | 错误码 |
| message | string | false | none | 描述 |
| data | string | false | none | 返回内容 |
