---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by luochen.
--- DateTime: 2018/6/9 18:31
---

local _M = {}


_M.call_proxy = function(proxy, servlet_path, args)

    local options = {method = ngx.HTTP_POST, args = args, ctx = proxy_ctx }
    local response = ngx.location.capture(proxy, options)

    ngx.print(response.body)
end


return _M