---
title: "打开第三方 App"
source: https://developer.dji.com/doc/cloud-api-tutorial/cn/feature-set/pilot-feature-set/pilot-third-party-app.html
version: 上云API v1.16.1 (developer.dji.com 官网快照 2026-09)
---

## 功能概述

对于使用DJI Pilot 2无法满足的业务场景，开发商可以自己开发一个轻型App与DJI Pilot一起使用，例如需要用遥控器进行对讲、特殊的任务命令、工单等等，这样对于终端用户来说，可以直接通过DJI Pilot的webview页面打开三方的APP，而开发商只需要在打开webview页面时，自动调用唤醒第三方App的JSBridge接口即可。详细的配置可以参考链接：[Android webview 中跳转第第三方App](https://developer.aliyun.com/article/595078)。

## 接口详细实现

跳转至第三方App `window.open('scheme://host...', arg)`
