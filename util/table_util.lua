local _M = {}

--根据索引，返回table中的元素
function _M.get_tabe_by_index(t, index)
    if index <= 0 or not t then
        return
    end
    local i = 0;
    for k, v in pairs(t) do
        i = i + 1
        if i == index then
            return k, v
        end
    end
end


-- 计算obj中table元素的个数，obj必须是table类型
function _M.table_nums(obj)
    local count = 0
    if not obj then
        return count
    end
    local is_table = _M.is_table(obj)
    if is_table then
        for k, v in pairs(obj) do
            -- 判断v是否是table
            local v_is_table = _M.is_table(v)
            if v_is_table then
                count = count + 1
            end
        end
    end
    return count
end


-- 是否是表格
function _M.is_table(obj)
    if not obj then
        return false
    end
    if type(obj) == "table" then
        return true
    end
    return false
end

-- 序列化，即toString
function _M.serialize(obj)
    if not obj then
        return ""
    end
    local lua = ""
    local t = type(obj)
    if t == "nil" then
        return nil
    elseif t == "number" then
        lua = lua .. obj
    elseif t == "boolean" then
        lua = lua .. tostring(obj)
    elseif t == "string" then
        lua = lua .. string.format("%q", obj)
    elseif t == "table" then
        lua = lua .. "{\n"
        for k, v in pairs(obj) do
            lua = lua .. "[" .. _M.serialize(k) .. "]=" .. _M.serialize(v) .. ",\n"
        end
        local metatable = getmetatable(obj)
        if metatable ~= nil and type(metatable.__index) == "table" then
            for k, v in pairs(metatable.__index) do
                lua = lua .. "[" .. _M.serialize(k) .. "]=" .. _M.serialize(v) .. ",\n"
            end
        end
        lua = lua .. "}"
    elseif t == "function" then
        lua = lua .. "function() end,\n"
    else
        error("can not serialize a " .. t .. " type.")
    end
    return lua
end



function _M.is_in_table(t, name, case_sens)
    if not case_sens then
        case_sens = false
    end
    for _, v in pairs(t) do
        if case_sens then
            if v and name == v then
                return true
            end
        else
            if v and string.lower(name) == string.lower(v) then
                return true
            end
        end
    end
    return false
end

-- 合并多个table，如果table中的key有冲突，那么使用后一个table的数据覆盖前一个table
function _M.merge(...)
    local arg = { ... }
    local result = {}
    for i, t in pairs(arg) do
        if t then
            for k, v in pairs(t) do
                result[k] = v
            end
        end
    end
    return result
end


function _M.copy_table_kv(old_table)
    if type(old_table) ~= "table" then
        return
    end
    local new_tab = {}
    for k, v in pairs(old_table) do
        local vtype = type(v)
        if vtype == "table" then
            new_tab[k] = _M.copy_table_kv(v)
        else
            new_tab[k] = v
        end
    end
    return new_tab
end

function _M.get_table_item_num(t)
    local size = 0
    if t then
        for _, _ in pairs(t) do
            size = size + 1
        end
    end
    return size
end

return _M;