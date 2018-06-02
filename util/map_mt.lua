--
-- Created by IntelliJ IDEA.
-- User: wuzhengfei
-- Date: 2018/2/1
-- Time: 15:17
-- To change this template use File | Settings | File Templates.
--

--map类型的元表

local _mt = {}
_mt.__tostring = function(self)
    local s = "{"
    local start = true
    for k, v in pairs(self) do
        if not start then
            s = s .. ", "
        end

        local t = type(v)

        local val = v
        if t == "table" then
            error( "not support table contain table!")
        elseif t == "boolean" then
            val = tostring(v)
        end

        if t ~= "function" then
            s = s .. k .. "=" .. val
        end
        start = false
    end
    s = s .. "}"
    return s
end

return _mt

