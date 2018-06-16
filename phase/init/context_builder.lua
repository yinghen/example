---
--- 初始化配置
--- Created by luochen.
--- DateTime: 2018/6/16 9:46
---
local config_loader = require("example.util.config_loader")
local cjson = require("cjson")

local _context = {}
    _context.init = function(config_path)
        local config = config_loader.load(config_path)
        ngx.log(ngx.INFO,"config_path = ",config_path,"  config=", cjson.encode(config))

        ------------------- 初始化guahao的上下文环境  -------------------
        -- 初始化缓存
        local global_config = ngx.shared.global_config;
        global_config:set("config", config)
        global_config:set("redis_config", redis_config)
        global_config:set("config_items", config_items)
    end
return _context
