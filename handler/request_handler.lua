---
--- open api 请求处理
--- Created by luochen.
--- DateTime: 2018/5/28 1:33
---

local _M = {}

    _M.init = function ()

        -- 获取客户端IP
        local ip = "1932.33.4.4.4"

        -- 获取请求头
        local request_header = require("example.helper.header_helper")
        local headers = request_header.get_custom_headers()
        ngx.ctx.headers = headers

        -- 获取请求参数
        local arg_helper = require("example.helper.arg_helper")
        local args = arg_helper.get_args();

    end

return _M;