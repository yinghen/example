---
--- open api header_helper
--- Created by luochen.
--- DateTime: 2018/5/28 1:54
---
local cjson = require("cjson")
local table_util = require("example.util.table_util")

local _M = {}

    -- API自定义请求头
    local custom_headers = { "appkey", "method", "accessToken", "timestamp", "sign" }

    -- 所有的header
    _M.get_headers = function()
        local headers = ngx.req.get_headers()
        return headers
    end

    -- 网关自定义的header
    local hs = {}
    _M.get_custom_headers = function()
        local headers = _M.get_headers();
        for k, v in pairs(headers) do
            ngx.say(k .. v)
            local flag = table_util.is_in_table(custom_headers, k)
            ngx.say(flag)
            if flag then
                hs[k] = v
            end
        end
    end

    ngx.say(cjson.encode(hs));

return _M;