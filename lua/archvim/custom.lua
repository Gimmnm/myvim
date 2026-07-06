-- ============================================================
-- macOS ARM 兼容层 / macOS ARM Compatibility Patches
-- 预装的 treesitter 解析器是 Linux x86_64 版本，macOS ARM 上需用
-- :TSInstall <lang> 手动安装。以下补丁确保缺少解析器时不崩溃。
-- ============================================================

-- 1. vim.treesitter.start — 高亮启动
local original_start = vim.treesitter.start
vim.treesitter.start = function(bufnr, lang)
    local ok, result = pcall(original_start, bufnr, lang)
    if not ok then
        return nil
    end
    return result
end

-- 2. vim.treesitter.language.add — 注册解析器
local original_lang_add = vim.treesitter.language.add
vim.treesitter.language.add = function(lang)
    local ok, err = pcall(original_lang_add, lang)
    if not ok then
        vim.notify("Treesitter parser not found: " .. tostring(lang) .. " (run :TSInstall " .. tostring(lang) .. ")", vim.log.levels.WARN)
    end
end

-- 3. vim.treesitter.language.inspect — many plugins call this, asserts on missing lang
local original_lang_inspect = vim.treesitter.language.inspect
vim.treesitter.language.inspect = function(lang)
    local ok, result = pcall(original_lang_inspect, lang)
    if ok then
        return result
    end
    return nil
end

-- 4. vim.treesitter.get_string_parser — trouble.nvim / aerial use this
local original_get_string_parser = vim.treesitter.get_string_parser
vim.treesitter.get_string_parser = function(str, lang, opts)
    local ok, result = pcall(original_get_string_parser, str, lang, opts)
    if ok then
        return result
    end
    return nil
end

-- 5. vim.treesitter.query.get — aerial calls this as get(lang, "aerial")
--    It's a table with __call metamethod, not __index. The memoized
--    __call asserts when parser is missing for a language.
local ts_query_get = vim.treesitter.query.get
if type(ts_query_get) == "table" then
    local orig_mt = getmetatable(ts_query_get)
    if orig_mt then
        -- Wrap __call (function-call syntax: query.get(lang, name))
        if orig_mt.__call then
            local orig_call = orig_mt.__call
            orig_mt.__call = function(t, lang, query_name)
                local ok, result = pcall(orig_call, t, lang, query_name)
                if ok then
                    return result
                end
                return nil
            end
        end
        -- Also wrap __index (table-access syntax: query.get[lang]) as defense-in-depth
        if orig_mt.__index then
            local orig_index = orig_mt.__index
            orig_mt.__index = function(t, k)
                local ok, result = pcall(orig_index, t, k)
                if ok then
                    return result
                end
                return nil
            end
        end
    end
end

-- 6. 屏蔽 bundles 插件的废弃 API 警告
--    直接包装 vim.deprecate (它有独立 C 层输出，不能通过 notify 拦截)
if vim.deprecate then
    local __orig_deprecate = vim.deprecate
    vim.deprecate = function(name, alternative, version, plugin, backtrace)
        if name and tostring(name):find("client") then return end
        return __orig_deprecate(name, alternative, version, plugin, backtrace)
    end
end
