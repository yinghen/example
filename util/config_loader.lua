local io = require("example.util.io")
local cjson = require("cjson")

local _M = {}
    function _M.load(config_path)
        local config_contents = io.read_file(config_path)
        local config = cjson.decode(config_contents)
        return config
    end
return _M
