--
-- Created by IntelliJ IDEA.
-- User: wuzhengfei
-- Date: 2018/1/31
-- Time: 15:36
-- To change this template use File | Settings | File Templates.
--
local _CODE = {}
    _CODE.system_error = { code = 1, message = "失败/处理请求出现异常." }

    -- 添加tostring方法
    for name, code in pairs(_CODE) do
        if type(code) == "table" then
            setmetatable(code, {
                __tostring = function()
                    return name .. "={code:" .. code.code .. ", message:" .. code.message .. "} "
                end
            })
        end
    end

    _CODE.get_by_code = function(code)
        local _c = tonumber(code);
        if not _c then
            return _CODE.system_error
        end

        for _k, _v in pairs(_CODE) do
            if type(_v) == "table" then
                if _v.code and _v.code == _c then
                    return _CODE[_k];
                end
            end
        end
    end
return _CODE