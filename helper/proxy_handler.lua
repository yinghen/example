---
--- 子请求代理
--- Created by luochen.
--- DateTime: 2018/6/2 18:07
---

local _M = {}


    --_M.call_proxy = function(proxy, servlet_path, args)
    --    local start = common_util.now()
    --    local uuid = ngx.ctx.uuid
    --
    --    local proxy_ctx = { orange_uuid = uuid }
    --    if servlet_path then
    --        proxy_ctx.servlet_path = servlet_path
    --    end
    --    ngx.log(ngx.INFO, "call_proxy start! uuid=", uuid, " proxy=", proxy, " path=", (servlet_path or ""), " args=",string_util.to_log(args))
    --    -- 发送子请求
    --    local options = {method = ngx.HTTP_POST, args = args, ctx = proxy_ctx }
    --    local response = ngx.location.capture(proxy, options)
    --    -- 返回结果的header信息
    --    ngx.ctx.response_headers = response.header
    --
    --
    --    local cost = common_util.now() - start
    --    -- 处理返回结果
    --    if response and ngx.HTTP_OK == response.status then
    --        local result = string_util.to_log(response.body)
    --        ngx.log(ngx.INFO, "call_proxy success! uuid=", uuid, " cost=", cost, " status=", response.status, result)
    --        --请求成功
    --        return true, return_code.success, response.body
    --    else
    --        ngx.log(ngx.ERR, "call_proxy failed! uuid=", uuid, " cost=", cost, " status=", response.status, " body=", response.body)
    --        return false, return_code.system_error
    --    end
    --end


return _M