local io = require("example.util.io")
local cjson = require("cjson")

local _M = {}
    function _M.load(config_path)
        local config = io.read_file(config_path)
        if not config then
            ngx.log(ngx.ERR, "No configuration file at: ", config_path)
            return
        end
        ngx.log(ngx.INFO, "this is configuration file", cjson.decode(config))
        return cjson.decode(config)
    end
return _M
