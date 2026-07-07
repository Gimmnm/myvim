-- 当前使用 tokyonight-day (浅色蓝调)
-- 其他可选 colorscheme:
--   :colorscheme tokyonight-night    (深沉暗色)
--   :colorscheme tokyonight-storm    (蓝调暗色)
--   :colorscheme tokyonight-moon     (紫调暗色)
--   :colorscheme gruvbox             (复古暖色)
--   :colorscheme catppuccin-mocha    (暖色暗色)
--   :colorscheme catppuccin-latte    (浅色)
--   :colorscheme nord                (冷色蓝调)

local colorscheme = "tokyonight-day"

-- 配置 tokyonight
require("tokyonight").setup({
    style = "day",
    transparent = require'archvim.options'.transparent_color,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
    },
    on_colors = function(colors)
        -- 可以在这里微调颜色
    end,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found, falling back to gruvbox...", vim.log.levels.WARN)
    pcall(vim.cmd, "colorscheme gruvbox")
end
