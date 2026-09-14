---
title: "文件组上传完成后回调"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/media-management/group-upload-callback.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 文件组上传完成后回调

`POST /media/api/v1/workspaces/{workspace_id}/group-upload-callback`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间 ID |
| x-auth-token | header | string | true | 访问令牌 |
| body | body | [storage.FolderUploadCallbackInput](#schemastorage.folderuploadcallbackinput) | true | body参数 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [storage.FolderUploadCallbackOutput](#schema_storage.FolderUploadCallbackOutput) |

> Example responses

```
{
	"code":0,
   	"data":{},
    "message": "success"
}
```

# Schemas

## storage.MissionFinishCallBackInput

```
{
  "file_group_id": "xxx",
  "file_count": 0,
  "file_uploaded_count": 0
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| file_group_id | string | false | none | 文件组id，在一次航线任务中产生的媒体文件组 ID 相同 |
| file_count | int | true | none | 指定文件组的媒体文件总数 |
| file_uploaded_count | int | true | none | 文件组中已经成功上传的媒体文件总数 |

## storage.FolderUploadCallbackOutput

```
{
  "code": 0,
  "data": {},
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | [storage.CreateFavoriteInput](#schemastorage.folderuploadcallbackinput) | false | none | none |
| message | string | false | none | 错误描述 |
