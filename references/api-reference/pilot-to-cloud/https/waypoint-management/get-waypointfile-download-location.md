---
title: "获取航线文件下载地址"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/get-waypointfile-download-location.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取航线文件下载地址

`GET /wayline/api/v1/workspaces/{workspace_id}/waylines/{id}/url`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| id | path | string | true | 航线文件id |
| x-auth-token | header | string | true | 访问令牌 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | / |
