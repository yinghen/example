---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by luochen.
--- DateTime: 2018/6/9 18:31
---


local system_error = "{ code = 1, message = '失败/处理请求出现异常.' }"

local _M = {}

    _M.call_proxy = function(proxy, servlet_path, args)
        local options = {method = ngx.HTTP_POST, args = args, ctx = proxy_ctx }
        local response = ngx.location.capture(proxy, options)

        -- 处理返回结果
        if response and ngx.HTTP_OK == response.status then
            --local result = string_util.to_log(response.body)
            --ngx.log(ngx.INFO, "call_proxy success! uuid=", uuid, " cost=", cost, " status=", response.status, result)
            return true, response.body
        else
            --ngx.log(ngx.ERR, "call_proxy failed! uuid=", uuid, " cost=", cost, " status=", response.status, " body=", response.body)
            return false, system_error
        end
    end

return _M