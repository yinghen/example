---
--- Lua 字符串工具类
--- Created by luochen.
--- DateTime: 2018/6/2 15:48
---

local LOG_VALUE_MAX_LENGTH = 20
local LOG_VALUE_SEPARATE = 10

local _M = {}

    -- 打印请求参数日志  长度截取 LOG_VALUE_SEPARATE .... LOG_VALUE_SEPARATE
    _M.to_log = function(data)
        if not data then
            return "";
        elseif "table" == type(data) then
            local content = {}
            for k , v in pairs(data) do
                content[k] = _M.string_sep(v)
            end
            return content;
        elseif "string" == type(data) then
            return _M.string_sep(data)
        end
    end

    _M.string_sep = function(obj)
        local length = string.len(obj);
        if length > LOG_VALUE_MAX_LENGTH then
            return string.sub(obj,1,LOG_VALUE_SEPARATE).."..."..string.sub(obj,-LOG_VALUE_SEPARATE,-1)
        else
            return obj
        end
    end

return _M
