-- 当前使用 tokyonight-storm (深色蓝调)
-- 其他可选 colorscheme:
--   :colorscheme tokyonight-night    (深沉暗色)
--   :colorscheme tokyonight-moon     (紫调暗色)
--   :colorscheme tokyonight-day      (浅色蓝调)
--   :colorscheme gruvbox             (复古暖色)
--   :colorscheme catppuccin-mocha    (暖色暗色)
--   :colorscheme catppuccin-frappe   (柔和暗蓝)
--   :colorscheme nord                (冷色蓝调)

local colorscheme = "tokyonight-storm"

-- 配置 tokyonight
require("tokyonight").setup({
    style = "storm",
    transparent = require'archvim.options'.transparent_color,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
    },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found, falling back to gruvbox...", vim.log.levels.WARN)
    pcall(vim.cmd, "colorscheme gruvbox")
end
