---
--- 单元测试
--- Created by luochen.
--- DateTime: 2018/6/2 12:11
---
local _M = {}


_M.call_proxy = function(proxy, servlet_path, args)

    local options = {method = ngx.HTTP_POST, args = args}
    local response = ngx.location.capture(proxy, options)

    ngx.print(response.body)

end

return _M;