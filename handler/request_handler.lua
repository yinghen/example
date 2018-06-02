---
--- open api 请求处理
--- Created by luochen.
--- DateTime: 2018/5/28 1:33
---

local _M = {}

    _M.init = function ()
        -- 获取请求头
        local request_header = require("example.helper.header_helper")
        request_header.get_custom_headers();

        -- 获取请求参数
    end

return _M;