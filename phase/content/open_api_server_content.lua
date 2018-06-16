---
--- Open API
--- Created by luochen.
--- DateTime: 2018/5/27 0:31
---

local proxy_handler = require("example.handler.proxy_handler")
local response = require("example.response.response")

local args = ngx.ctx.args
local proxy = "/open_api_proxy_router"


-- 远程请求
local success, data = proxy_handler.call_proxy(proxy,args)

local global_config = ngx.shared.global_config;

print(global_config:get("redis_config"))

response.say(success,data)