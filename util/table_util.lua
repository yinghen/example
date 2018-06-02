---
--- Table 工具类
--- Created by luochen.
--- DateTime: 2018/6/2 11:11
---

local _M = {}

    -- Table中是否包含name
    _M.is_in_table = function(t, name)
        for _, v in pairs(t) do
            if v and name == v then
                return true
            end
        end
        return false
    end

return _M;