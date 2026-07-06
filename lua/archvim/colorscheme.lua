-- 当前使用 gruvbox
-- 其他可选 colorscheme:
--   :colorscheme tokyonight-night    (深沉暗色)
--   :colorscheme tokyonight-storm    (蓝调暗色)
--   :colorscheme catppuccin-mocha    (暖色暗色，非常流行)
--   :colorscheme catppuccin-macchiato
--   :colorscheme catppuccin-frappe
--   :colorscheme catppuccin-latte    (浅色)
--   :colorscheme nord                (冷色蓝调)

local colorscheme = "gruvbox"

-- 配置 gruvbox
require("gruvbox").setup({
    terminal_colors = true,
    transparent_mode = require'archvim.options'.transparent_color,
    contrast = "",            -- "" | "soft" | "hard"
    overrides = {
        -- 可以在这里自定义颜色
    },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found, falling back to tokyonight...", vim.log.levels.WARN)
    pcall(vim.cmd, "colorscheme tokyonight-night")
end
