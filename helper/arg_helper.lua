---
--- Open API arg_helper
--- Created by luochen.
--- DateTime: 2018/6/2 12:33
---
local table_util = require("example.util.table_util")
local cjson = require("cjson")

local _M = {}

    -- 获取请求参数
    _M.get_args = function()

        -- POST 请求参数
        ngx.req.read_body()
        local post_args = ngx.req.get_post_args() or {}
        --ngx.log(ngx.INFO,"post_args："..cjson.encode(post_args));

        -- POST 某些请求参数放入URL中
        local url_args = ngx.req.get_uri_args() or {}
        --ngx.log(ngx.INFO,"url_args："..cjson.encode(url_args));
        local args = table_util.merge(url_args, post_args);

        return args
    end

return _M

