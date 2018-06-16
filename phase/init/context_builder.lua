---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by luochen.
--- DateTime: 2018/6/16 9:46
---
local config_loader = require("example.util.config_loader")

local _context = {}
    _context.init = function(config_path)
        local config_file = ngx.config.prefix() .. config_path
        local config = config_loader.load(config_file)

        ------------------- 初始化guahao的上下文环境  -------------------
        -- 初始化缓存
        local global_config = ngx.shared.global_config;
        global_config:set("config", config)
        global_config:set("redis_config", redis_config)
        global_config:set("config_items", config_items)
    end
return _context