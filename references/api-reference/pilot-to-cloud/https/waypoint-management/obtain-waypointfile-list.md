---
title: "获取航线文件列表"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/https/waypoint-management/obtain-waypointfile-list.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 获取航线列表

`GET /wayline/api/v1/workspaces/{workspace_id}/waylines`

### Parameters

| Name | In | Type | Required | Description |
| --- | --- | --- | --- | --- |
| workspace_id | path | string | true | 工作空间id |
| favorited | query | boolean | false | 是否收藏 |
| order_by | query | string | false | 排序（xxx_column desc 或 xxx_column asc, 若不传排序后缀默认为asc，多个字段排序可通过','拼接） |
| page | query | integer | false | 页数 |
| page_size | query | integer | false | 每页大小 |
| template_type | query | array[integer] | false | 航线模版类型 |
| x-auth-token | header | string | true | 访问令牌 |
| action_type | query | integer | false | 1：开启精准复拍航线。不填本字段，表示所有航线。 |
| drone_model_keys | query | array[string] | false | 机型筛选 |
| payload_model_key | query | array[string] | false | 负载筛选 |

### Responses

| Status | Meaning | Description | Schema |
| --- | --- | --- | --- |
| 200 |  | OK | [wayline.GetWaylinesOutput](#schemawayline.getwaylinesoutput) |

> Example responses

```
{
    "code":0,
    "message":"success",
    "data":{
        "list":[
            {
                "id":"uuid",
                "drone_model_key":"0-67-0",
                "favorited":false,
                "name":"新建航线1",
                "payload_model_keys":[
                    "1-53-0"
                ],
                "template_types":[
                    0
                ],
                "action_type": 0,
                "update_time":1637158501230,
                "user_name": "string",
                "start_wayline_point": {
                  "start_latitude": 22.5799601837589,
                  "start_lontitude": 113.942744030171
                  }
            }
        ],
        "pagination":{
            "page":1,
            "page_size":9,
            "total":10
        }
    }
}
```

# Schemas

## wayline.GetWaylinesOutput

```
{
  "code": 0,
  "data": {
    "list": [
      {
        "drone_model_key": "string",
        "favorited": true,
        "id": "string",
        "name": "string",
        "payload_model_keys": [
          "string"
        ],
        "template_types": [
          0
        ],
        "action_type": 0,
        "update_time": 0,
        "user_name": "string",
        "start_wayline_point": {
          "start_latitude": 22.5799601837589,
          "start_lontitude": 113.942744030171
          }
      }
    ],
    "pagination": {
      "page": 0,
      "page_size": 0,
      "total": 0
    }
  },
  "message": "string"
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| code | integer | false | none | 错误码 |
| data | [wayline.GetWaylinesOutputData](#schemawayline.getwaylinesoutputdata) | false | none | none |
| message | string | false | none | 错误描述 |

## wayline.GetWaylinesOutputData

```
{
  "list": [
    {
      "drone_model_key": "string",
      "favorited": true,
      "id": "string",
      "name": "string",
      "payload_model_keys": [
        "string"
      ],
      "template_types": [
        0
      ],
      "action_type": 0,
      "update_time": 0,
      "user_name": "string",
      "start_wayline_point": {
         "start_latitude": 22.5799601837589,
         "start_lontitude": 113.942744030171
         }
    }
  ],
  "pagination": {
    "page": 0,
    "page_size": 0,
    "total": 0
  }
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| list | [[wayline.AppFileItem](#schemawayline.appfileitem)] | false | none | none |
| pagination | [api_render.PagyInfo](#schemaapi_render.pagyinfo) | false | none | none |

## wayline.AppFileItem

```
{
  "drone_model_key": "string",
  "favorited": true,
  "id": "string",
  "name": "string",
  "payload_model_keys": [
    "string"
  ],
  "template_types": [
    0
  ],
  "action_type": 0,
  "update_time": 0,
  "user_name": "string",
  "start_wayline_point": {
     "start_latitude": 22.5799601837589,
     "start_lontitude": 113.942744030171
     }
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| drone_model_key | string | false | none | 飞机产品枚举值 |
| favorited | boolean | false | none | 是否收藏 |
| id | string | false | none | 航线id |
| name | string | false | none | 航线名称 |
| payload_model_keys | [string] | false | none | 负载产品枚举值集合 |
| template_types | [integer] | false | none | 航线模版类型集合 |
| update_time | integer | false | none | 航线更新时间（毫秒） |
| user_name | string | false | none | 上传者名称 |
| start_wayline_point | array[float] | false | none | 航线起始点 |
| start_latitude | float | false | none | 航线起始点纬度 |
| start_lontitude | float | false | none | 航线起始点经度 |

## api_render.PagyInfo

```
{
  "page": 0,
  "page_size": 0,
  "total": 0
}
```

*Properties*

| Name | Type | Required | Restrictions | Description |
| --- | --- | --- | --- | --- |
| page | integer | false | none | 当前页数 |
| page_size | integer | false | none | 分页大小 |
| total | integer | false | none | 总数 |
