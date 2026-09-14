---
title: "设备管理"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/api-reference/pilot-to-cloud/mqtt/dji-rc-plus-2/device.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

# Event

## 设备拓扑更新

**Topic:** thing/product/{gateway_sn}/status

**Direction:** up

**Method:** update_topo

**Data:**

| Column | Name | Type | constraint | Description |
| --- | --- | --- | --- | --- |
| type | 网关设备的产品类型 | int |  | 参考：[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| sub_type | 网关子设备的产品子类型 | int |  | 参考：[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| device_secret | 网关设备的密钥 | text |  |  |
| nonce | nonce | text |  |  |
| thing_version | 网关设备的物模型版本 | text |  |  |
| sub_devices | 子设备列表 | array | {"size": 1, "item_type": struct} |  |
| »sn | 子设备序列号（SN） | text |  |  |
| »type | 子设备的产品类型 | int |  | 参考：[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| »sub_type | 子设备的产品子类型 | int |  | 参考：[产品支持](https://developer.dji.com/doc/cloud-api-tutorial/cn/overview/product-support.html) |
| »device_secret | 子设备的密钥 | text |  |  |
| »nonce | nonce | text |  |  |
| »thing_version | 子设备的物模型版本 | text |  |  |
