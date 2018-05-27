---
--- Open API接口访问控制
--- Created by luochen.
--- DateTime: 2018/5/28 1:29
---

-- 引入库
local request_method = ngx.var.request_method;

ngx.log(ngx.INFO,"request method = ",request_method);

ngx.say("hello world");


