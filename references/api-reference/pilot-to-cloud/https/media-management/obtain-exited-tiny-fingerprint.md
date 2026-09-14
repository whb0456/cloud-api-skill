---
title: "获取已存在的文件精简指纹"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/media-management/obtain-exited-tiny-fingerprint.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取已经存在的文件夹精简指纹

`POST /media/api/v1/workspaces/{workspace_id}/files/tiny-fingerprints`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| tiny_fingerprints | body | array[string] | true | 精简指纹数组 |
| workspace_id | path | string | true | 工作空间id |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [media.GetTinyFingerprintsOutput](#schemamedia.gettinyfingerprintsoutput) |

> Example responses

```
{
    "code":0,
    "message":"success",
    "data":{
        "tiny_fingerprints":[
            "5aec4c6e78052bf38fab901bcd1a2319_2021_12_8_22_13_10" //已经存在的精简文件指纹
        ]
    }
}
```

# Schemas

## media.GetTinyFingerprintsOutput

```
{
    "code":0,
    "message":"success",
    "data":{
        "tiny_fingerprints":[
            "string"
        ]
    }
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | string | false | none | 错误码 |
| message | string | false | none | 描述 |
| data | string | false | none | 返回内容 |
| » tiny_fingerprints | [string] | false | none | 已经存在的精简指纹数组 |
