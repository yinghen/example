---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by luochen.
--- DateTime: 2018/6/2 11:11
---
local cjson = require("cjson")


local _M = {}


    function _M.decode(data)
        if not data then return nil end

        return cjson.decode(data)
    end

return _M;
