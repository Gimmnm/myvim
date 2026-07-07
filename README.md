# My NeoVim Config

macOS 专用的 NeoVim 配置，基于 [archibate/vimrc](https://github.com/archibate/vimrc) 定制，适配 MacBook + iTerm2。

## 环境要求

- **NeoVim** >= 0.10
- **系统**：macOS (Apple Silicon / Intel)
- **终端**：iTerm2（推荐）、Kitty、Alacritty、WezTerm
- **字体**：[Nerd Fonts](https://www.nerdfonts.com/)（推荐 JetBrainsMono Nerd Font）
- **依赖**：`gcc`（编译 treesitter 解析器）、`ripgrep`（全文搜索）、`clangd`（C++ 补全）

```bash
brew install gcc ripgrep ninja clangd
```

## 安装

```bash
# 克隆到 neovim 配置目录
git clone git@github.com:Gimmnm/myvim.git ~/.config/nvim

# 首次启动会自动安装 packer.nvim，然后运行：
:PackerSync
```

## 快捷键速查

### 基本操作

| 快捷键 | 功能 |
|--------|------|
| `jk` / `kj` | 退出插入模式 |
| `,` (leader) | 前缀键 |
| `q` | 关闭窗口 |
| `F4` | 全部保存 |
| `F7` | 文件树 |
| `F8` | 终端 |
| `F9` | 诊断列表 |
| `F10` | Git 面板 |

### 窗口分割

| 快捷键 | 备用键 | 功能 |
|--------|--------|------|
| `Ctrl+w s` | `M-s` | 水平分割 |
| `Ctrl+w v` | `M-v` | 垂直分割 |
| `Ctrl+w q` | `q` | 关闭窗口 |
| `Ctrl+h/j/k/l` | — | 窗口间移动 |

### 模糊搜索（Telescope）

| 快捷键 | 功能 |
|--------|------|
| `,l` | 查找文件 |
| `,k` | 全文搜索 |
| `,b` | Buffer 列表 |
| `,o` | 最近打开文件 |
| `,p` | Git 变更文件 |
| `,c` | Git 提交历史 |
| `,,` | 恢复上次搜索 |

### LSP / 代码

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转定义 |
| `gr` | 查找引用 |
| `go` | 头文件/源文件切换 |
| `K` | 查看文档 |
| `gn` | 重命名 |
| `gw` | 代码修复 |
| `g=` | 格式化 |
| `gcc` | 注释切换 |
| `gsi` | 开关 Inlay Hint |

### CMake

| 快捷键 | 功能 |
|--------|------|
| `cmc` | CMake 配置 |
| `cmb` | CMake 编译 |
| `cmr` / `F5` | 编译+运行 |
| `cms` / `F17` | 停止运行 |
| `F6` | 编译错误列表 |

## 插件列表（已启用）

### 核心
| 插件 | 用途 |
|------|------|
| [packer.nvim](https://github.com/wbthomason/packer.nvim) | 插件管理器 |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | 通用工具库 |

### LSP / 补全
| 插件 | 用途 |
|------|------|
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 服务器管理 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 客户端配置 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 自动补全框架 |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | 代码片段引擎 |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | 函数签名提示 |
| [diagflow.nvim](https://github.com/dgagn/diagflow.nvim) | 诊断信息展示 |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | 诊断列表面板 |

### 语法高亮
| 插件 | 用途 |
|------|------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法解析和高亮 |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | 文本对象选择 |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | 自动闭合 HTML 标签 |

### 颜色主题
| 插件 | 当前 |
|------|------|
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | ⬅️ 使用中 |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 备选 |
| [catppuccin](https://github.com/catppuccin/nvim) | 备选 |
| [nord.nvim](https://github.com/shaunsingh/nord.nvim) | 备选 |

### 模糊搜索
| 插件 | 用途 |
|------|------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊搜索核心 |
| [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | fzf 排序算法 |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | 备选搜索后端 |

### Git
| 插件 | 用途 |
|------|------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | 行内 Git 状态 |
| [neogit](https://github.com/NeogitOrg/neogit) | Git 操作面板 |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Diff 查看 |

### 编辑增强
| 插件 | 用途 |
|------|------|
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 括号包围操作 |
| [nvim-comment](https://github.com/terrortylor/nvim-comment) | 注释切换 |
| [neoformat](https://github.com/sbdchd/neoformat) | 代码格式化 |
| [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler) | 布尔值/单词对切换 |
| [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) | 实时重命名预览 |
| [pastify.nvim](https://github.com/TobinPalmer/pastify.nvim) | 图片粘贴 |

### 导航 / 移动
| 插件 | 用途 |
|------|------|
| [hop.nvim](https://github.com/phaazon/hop.nvim) | 屏幕内快速跳转 |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | 代码大纲 |
| [local-highlight.nvim](https://github.com/tzachar/local-highlight.nvim) | 光标词高亮 |
| [ouroboros](https://github.com/jakemason/ouroboros) | 头文件/源文件切换 |
| [stickybuf.nvim](https://github.com/stevearc/stickybuf.nvim) | Buffer 固定 |
| [scope.nvim](https://github.com/tiagovla/scope.nvim) | Tab 内 buffer 隔离 |

### UI
| 插件 | 用途 |
|------|------|
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer 标签栏 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树 |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | 文件图标 |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | 通知 UI |
| [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) | 专注模式 |
| [twilight.nvim](https://github.com/folke/twilight.nvim) | 代码区域聚焦 |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | 输入框美化 |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | UI 工具集 |

### 构建 / 终端
| 插件 | 用途 |
|------|------|
| [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim) | CMake 集成 |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 内置终端 |
| [vim-pio](https://github.com/normen/vim-pio) | PlatformIO 支持 |

### 会话 / 杂项
| 插件 | 用途 |
|------|------|
| [nvim-lastplace](https://github.com/ethanholz/nvim-lastplace) | 记住上次光标位置 |
| [tmux.nvim](https://github.com/aserowy/tmux.nvim) | tmux 无缝导航 |
| [opencode.nvim](https://github.com/NickvanDyke/opencode.nvim) | AI 代码辅助 |
| [nvim-mcp](https://github.com/linw1995/nvim-mcp) | MCP 协议支持 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown 预览 |
| [image.nvim](https://github.com/3rd/image.nvim) | 图片显示 |
| [fcitx.nvim](https://github.com/h-hg/fcitx.nvim) | 中文输入法自动切换 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown 实时预览 |

## 自定义

- 修改插件：编辑 `lua/archvim/plugins.lua`
- 修改快捷键：编辑 `lua/archvim/mappings.lua`
- 修改 LSP 服务器：编辑 `lua/archvim/config/mason.lua`
- 修改 treesitter 解析器：编辑 `lua/archvim/config/treesitter.lua`
- 切换配色：`lua/archvim/colorscheme.lua`

修改插件后运行 `:PackerSync` 生效。

## 参考

- 原始项目：[archibate/vimrc](https://github.com/archibate/vimrc)
- 快捷键手册：[MANUAL.md](MANUAL.md)
