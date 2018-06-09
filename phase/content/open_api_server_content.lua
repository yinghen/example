---
--- Open API
--- Created by luochen.
--- DateTime: 2018/5/27 0:31
---

local proxy_handler = require("example.handler.proxy_handler")


local args = ngx.ctx.args

local proxy = "/open_api_proxy_router"

proxy_handler.call_proxy(proxy,args)

