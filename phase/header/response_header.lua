--
-- Created by IntelliJ IDEA.
-- User: wuzhengfei
-- Date: 2018/3/1
-- Time: 18:07
-- To change this template use File | Settings | File Templates.
--

if ngx.ctx.response_headers then
    for k, v in pairs(ngx.ctx.response_headers) do
        ngx.header[k] = v
    end
end