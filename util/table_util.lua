---
--- table 工具类
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

    -- 合并两个table，如果table中的key有冲突，那么使用后一个table的数据覆盖前一个table
    function _M.merge(tab, _tab)
        for k,v in pairs(_tab) do
            tab[k] = v;
        end
        return tab
    end

return _M;