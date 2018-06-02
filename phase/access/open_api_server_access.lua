---
--- Open API接口访问控制
--- Created by luochen.
--- DateTime: 2018/5/28 1:29
---

-- 引入库
local request_handler = require("example.handler.request_handler")

local request_method = ngx.var.request_method;

if "OPTIONS" == request_method then
    return ngx.exec("@open_api_proxy_options")
end

request_handler.init();



ngx.say("hello world");


