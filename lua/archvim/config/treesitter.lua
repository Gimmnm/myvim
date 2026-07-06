-- 已安装的解析器 (用 :TSInstall <lang> 安装更多)
-- 当前安装: c, cpp, lua, python, bash, json, vim
local ts_list = {
    "c", "cpp", "lua", "python", "bash", "json", "vim",
}
-------------------------------
require'nvim-treesitter'.setup {
    ensure_installed = ts_list,
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,  -- macOS ARM: parsers auto-installed via :TSInstall
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = false,
    },
    indent = {
        enable = false,
    },
    rainbow = {
        enable = false,
    },
    matchup = {
        enable = false,
    },
    context_commentstring = {
        enable = false,
    },
    textobjects = {
        select = {
            enable = false,
        },
        swap = {
            enable = false,
        },
        move = {
            enable = false,
        },
        lsp_interop = {
            enable = false,
        },
    },
    autotag = {
        enable = false,
    },
}

vim.g.matchup_matchparen_offscreen = { method = "status" }
vim.g.matchup_surround_enabled = 1
vim.g.matchup_delim_noskips = 2
