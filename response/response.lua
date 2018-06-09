---
--- 返回结果处理
--- Created by luochen.
--- DateTime: 2018/6/9 19:30
---
local cjson = require("cjson")

local _response = {}

    _response.say = function(success , data)
        local data_log = cjson.encode(data);
        if not success then
            --ngx.log(ngx.ERR, "failed! uuid=", uuid, " appkey=", appkey, " method=", method, " cost=", cost, data_log)
        else
            --ngx.log(ngx.INFO, "success! uuid=", uuid, " appkey=", appkey, " method=", method, " cost=", cost, data_log)
        end
        ngx.print(data)
    end

return _response