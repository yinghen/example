---
--- Open API arg_helper
--- Created by luochen.
--- DateTime: 2018/6/2 12:33
---
local cjson = require("cjson")

local _M = {}

    -- 获取请求参数
    _M.get_args = function()

        ngx.req.read_body()
        local post_args = ngx.req.get_post_args()
        ngx.say(cjson.encode(post_args))

    end

return _M

