local io = require("example.util.io")
local cjson = require("cjson")

local _M = {}
    function _M.load(config_path)
        local config_contents = io.read_file(config_path)
        if config_contents then
            return cjson.decode(config_contents)
        end
    end
return _M
