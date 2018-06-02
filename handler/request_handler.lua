---
--- open api 请求处理
--- Created by luochen.
--- DateTime: 2018/5/28 1:33
---
local cjson = require("cjson")

local _M = {}

    M.get_uuid = function()
        return os.date("%Y%m%d%H%M%S", os.time()) .. "-" .. (math.random(random_seed))
    end

    _M.init = function ()

        ngx.ctx.request_start = common_util.now()
        ngx.ctx.uuid = _M.get_uuid()

        -- 获取客户端IP
        local ip = "1932.33.4.4.4"
        ngx.ctx.client_ip = ip

        -- 获取请求头
        local request_header = require("example.helper.header_helper")
        local headers = request_header.get_custom_headers()
        ngx.ctx.headers = headers

        -- 获取请求参数
        local arg_helper = require("example.helper.arg_helper")
        local args = arg_helper.get_args();
        ngx.ctx.args = args

        ngx.log(ngx.INFO, "accept request! uuid=", ngx.ctx.uuid, ", client ip=", ngx.ctx.client_ip, " headers=", cjson.encode(headers), ", args=", cjson.encode(args))
    end

return _M;