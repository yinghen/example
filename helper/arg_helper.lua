---
--- Open API arg_helper
--- Created by luochen.
--- DateTime: 2018/6/2 12:33
---
local _M = {}

    -- 获取请求参数
    _M.get_args = function()

        -- POST 请求参数
        ngx.req.read_body()
        local post_args = ngx.req.get_post_args() or {}

        -- POST 某些请求参数放入URL中
        local url_args = ngx.req.get_uri_args() or {}


        return post_args
    end

return _M

