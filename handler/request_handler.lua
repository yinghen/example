---
--- open api 请求处理
--- Created by luochen.
--- DateTime: 2018/5/28 1:33
---
local cjson = require("cjson")

local _M = {}

    _M.get_uuid = function()
        local random_seed = 1000000
        return os.date("%Y%m%d%H%M%S", os.time()) .. "-" .. (math.random(random_seed))
    end

    _M.init = function ()

        ngx.ctx.request_start = ngx.now() * 1000
        ngx.ctx.uuid = _M.get_uuid()

        -- 获取客户端IP
        local ip_helper = require("example.helper.ip_helper")
        ngx.ctx.client_ip = ip_helper.get_client_ip()

        -- 获取请求头
        local request_helper = require("example.helper.header_helper")
        local headers = request_helper.get_custom_headers()
        ngx.ctx.headers = headers

        -- 获取请求参数
        local arg_helper = require("example.helper.arg_helper")
        local args = arg_helper.get_args();
        ngx.ctx.args = args


        local string_util = require("example.util.string_util")
        local args_log = string_util.to_log(args)

        ngx.log(ngx.INFO, "accept request! uuid=", ngx.ctx.uuid, ", client ip=", ngx.ctx.client_ip, " headers=", cjson.encode(headers), ", args=", cjson.encode(args_log))
    end

return _M;