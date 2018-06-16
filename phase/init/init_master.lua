---
--- 初始化上下文环境
--- Created by luochen.
--- DateTime: 2018/5/28 1:22
---


local context_builder = require("example.phase.init.context_builder")

local _M = {}
    _M.init = function()
        local config_path = "/home/luochen/example/conf/nginx-gateway.conf"
        context_builder.init(config_path);
    end
return _M


