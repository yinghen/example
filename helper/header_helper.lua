---
--- open api header_helper
--- Created by luochen.
--- DateTime: 2018/5/28 1:54
---


local _M = {}


    -- 所有的header
    _M.get_headers = function()
        local headers = ngx.req.get_headers()
        ngx.say("headers begin", "<br/>")
        ngx.say("Host : ", headers["Host"], "<br/>")
        ngx.say("user-agent : ", headers["user-agent"], "<br/>")
        ngx.say("user-agent : ", headers.user_agent, "<br/>")
        for k,v in pairs(headers) do
            if type(v) == "table" then
                ngx.say(k, " : ", table.concat(v, ","), "<br/>")
            else
                ngx.say(k, " : ", v, "<br/>")
            end
        end
        ngx.say("headers end", "<br/>")
        ngx.say("<br/>")
    end

    -- 网关自定义的header
    _M.get_custom_headers = function()

        _M.get_headers();
    end

return _M;