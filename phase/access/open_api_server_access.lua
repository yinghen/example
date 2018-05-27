---
--- Open API接口访问控制
--- Created by luochen.
--- DateTime: 2018/5/28 1:29
---

-- 引入库
local request_method = ngx.var.request_method;

if "OPTIONS" == request_method then
    return ngx.exec("@open_api_proxy_options")
end


local request_handler = require("handler.request_handler")

request_handler.init();

ngx.log(ngx.INFO,"request method = ",request_method);

ngx.say("hello world");


