--
-- Created by IntelliJ IDEA.
-- User: wuzhengfei
-- Date: 2018/1/31
-- Time: 15:36
-- To change this template use File | Settings | File Templates.
--
_CODE = {}
_CODE.success = { code = 0, message = "成功" }

--   ---------服务 0 - 99999 90000- 99999 通用服务相关---------
_CODE.system_error = { code = 1, message = "失败/处理请求出现异常." }
_CODE.system_not_avaiable = { code = 2, message = "服务不可用." }
_CODE.invalid_uri = { code = 3, message = "您请求的路径不存在，请检查您的路径或联系管理员！" }


--   ---------限制 100000 - 199999 190000-199999 服务接口级限制相关 */
--_CODE.service_url_not_found = { code = 100001, message = "服务提供方连接未找到，请联系管理员" }

_CODE.invalid_request = { code = 100100, message = "非法请求" }


--   ---------验证 200000 - 299999 290000-299999 请求参数验证相关 */
_CODE.param_error = { code = 200000, message = "参数错误" }

_CODE.app_key_error = { code = 200002, message = "appkey错误，找不到记录" }
_CODE.sign_not_match = { code = 200051, message = "签名错误" }
_CODE.js_sign_not_match = { code = 200052, message = "js签名验证失败" }



_CODE.invalid_appkey = { code = 202101, message = "appkey空值!" }
_CODE.invalid_method_blank = { code = 202103, message = "method为空!" }
_CODE.invalid_method_error = { code = 202104, message = "method错误!" }
_CODE.invalid_noservice = { code = 202105, message = "服务不存在!" }
_CODE.invalid_required = { code = 202106, message = "参数不能为空!" }
_CODE.invalid_noauth = { code = 202108, message = "您没有访问该服务的权限，若要访问该服务，请申请!" }
_CODE.sign_blank = { code = 202109, message = "sign字段为空" }

--   ---------失效 300000 - 399999 390000-399999 失效相关 */
_CODE.token_error = { code = 300000, message = "token错误，无法获取userid" }
_CODE.ticket_not_found = { code = 300001, message = "ticket不存在或者已经过期，请重新刷新ticket" }

--   ---------安全 400000 - 499999 490000-499999 安全/授权相关. */
_CODE.decrypt_failed = { code = 400000, message = "解密失败，请检查APP配置信息是否正确" }
_CODE.request_ip_not_allowed = { code = 400001, message = "请求源的ip未授权，请联系管理员" }


--   ---------异常  500000 - 599999 590000 - 599999 异常相关相应码  */
_CODE.redis_operation_failed = { code = 500001, message = "读/写redis失败" }
--_CODE.read_from_redis_failed = { code = 500002, message = "读缓存失败" }
_CODE.no_result_return = { code = 500003, message = "没有结果返回" }
_CODE.not_found_in_redis = { code = 500004, message = "缓存中未找到记录" }


-- 添加tostring方法
for name, code in pairs(_CODE) do
    if type(code) == "table" then
        setmetatable(code, {
            __tostring = function()
                return name .. "={code:" .. code.code .. ", message:" .. code.message .. "} "
            end
        })
    end
end

_CODE.get_by_code = function(code)
    local _c = tonumber(code);
    if not _c then
        return _CODE.system_error
    end

    for _k, _v in pairs(_CODE) do
        if type(_v) == "table" then
            if _v.code and _v.code == _c then
                return _CODE[_k];
            end
        end
    end
end

return _CODE