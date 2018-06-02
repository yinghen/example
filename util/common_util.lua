local _M = {}

    _M.now = function()
        return ngx.now() * 1000
    end

return _M;