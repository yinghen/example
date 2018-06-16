local _M = {}

---
-- Checks existence of a file.
-- @param file path/file to check
-- @return `true` if found, `false` + error message otherwise
function _M.file_exists(path)
    local f, err = io.open(path, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false, err
    end
end


--- Read file contents.
-- @param file filepath to read
-- @return file contents as string, or `nil` if not succesful
function _M.read_file(path)
    local contents
    local file = io.open(path, "rb")
    if file then
        contents = file:read("*all")
        file:close()
    end
    return contents
end

--- Write file contents.
-- @param file filepath to write to
-- @return `true` upon success, or `false` + error message on failure
function _M.write_to_file(path, value)
    local file, err = io.open(path, "w")
    if err then
        return false, err
    end

    file:write(value)
    file:close()
    return true
end


--- Get the filesize.
-- @param file path to file to check
-- @return size of file, or `nil` on failure
function _M.file_size(path)
    local size
    local file = io.open(path, "rb")
    if file then
        size = file:seek("end")
        file:close()
    end
    return size
end

return _M
