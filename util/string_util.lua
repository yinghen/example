---
--- Lua 字符串工具类
--- Created by luochen.
--- DateTime: 2018/6/2 15:48
---

local LOG_VALUE_MAX_LENGTH = 100
local LOG_VALUE_SEPARATE = 20

local _M = {}

    _M.to_log = function(data)
        if not data then
            return "";
        elseif "table" == type(data) then
            local content = {}
            for k , v in pairs(data) do
                content[k] = M.string_sub(v)
            end
            return content;
        elseif "string" == type(data) then
            return _M.string_sub(data)
        end
    end

    _M.string_sub = function(obj)
        local length = string.len(obj);
        if length > LOG_VALUE_MAX_LENGTH then
            return string.sub(data,0,LOG_VALUE_SEPARATE).."..."..string.sub(data,length-20,length)
        else
            return data
        end
    end

return _M
