---
--- Open API ip_helper
--- Created by luochen.
--- DateTime: 2018/6/2 15:33
---

local _M = {}

    _M.get_client_ip = function()
        local ip = ngx.req.get_headers()["x_forwarded_for"]
        if not ip then
            ip = ngx.var.remote_addr
        else
            ip = ngx.re.gsub(ip, ",.*", "")
        end
        return ip
    end

return _M