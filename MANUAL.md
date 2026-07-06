# NeoVim 使用手册

> 基于 archibate/vimrc 配置 | 配色: TokyoNight | Leader: `,`

## 目录

- [一、基础操作](#一基础操作)
- [二、文件与窗口管理](#二文件与窗口管理)
- [三、代码编辑](#三代码编辑)
- [四、LSP 智能功能](#四lsp-智能功能)
- [五、搜索与跳转](#五搜索与跳转)
- [六、Git 集成](#六git-集成)
- [七、终端与编译运行](#七终端与编译运行)
- [八、插件快捷键速查](#八插件快捷键速查)
- [九、配色切换](#九配色切换)

---

## 一、基础操作

### 启动与退出

```bash
nvim                    # 启动 NeoVim
nvim <文件>             # 打开文件
nvim <目录>             # 以文件树方式打开目录
nvim file1.c file2.h    # 同时打开多个文件
```

| 快捷键 | 功能 |
|--------|------|
| `q` | 关闭当前窗口 |
| `Q` | 录制宏（原始功能） |
| `jk` / `kj` | 退出插入模式（代替 Esc） |
| `:w` | 保存 |
| `:wa` | 全部保存 |
| `:q` | 退出 |
| `:wq` / `ZZ` | 保存并退出 |
| `:qa!` | 强制全部退出 |

### 移动光标

| 快捷键 | 功能 |
|--------|------|
| `h j k l` | 左 下 上 右 |
| `w / b` | 下一个/上一个单词 |
| `e` | 单词末尾 |
| `0 / ^` | 行首（第一个非空字符） |
| `gh` | 行首，按 `3gh` 跳到第3个字符 |
| `$ / gl` | 行尾 |
| `gg` | 文件开头 |
| `G` | 文件末尾 |
| `Ctrl+u / Ctrl+d` | 上翻/下翻半页 |
| `Ctrl+b / Ctrl+f` | 上翻/下翻整页 |
| `zz` | 将当前行居中 |
| `M-z` | 同上（需 Meta 键支持） |
| `M-b / M-w / M-e` | 以词为单位移动（需 Meta 键支持） |

### 编辑

| 快捷键 | 功能 |
|--------|------|
| `i` | 在光标前插入 |
| `a` | 在光标后插入 |
| `o / O` | 下方/上方新行 |
| `u / Ctrl+r` | 撤销/重做 |
| `x` | 删除字符 |
| `dd` | 删除行 |
| `yy` | 复制行 |
| `p / P` | 粘贴到下方/上方 |
| `>` / `<` | 缩进/反缩进 |
| `=` | 自动缩进（选中后） |
| `g=` | 格式化代码（LSP） |
| `Ctrl+g` | 切换布尔值/单词对 (nvim-toggler) |

### 选择模式

| 快捷键 | 功能 |
|--------|------|
| `v` | 字符选择 |
| `V` | 行选择 |
| `Ctrl+v` | 列块选择 |

---

## 二、文件与窗口管理

### 文件树 (nvim-tree)

| 快捷键 | 功能 |
|--------|------|
| `F7` | 打开/关闭文件树 |
| `gsp` | 打开文件树并定位到当前文件 |

在文件树中：
- `Enter` / `o` — 打开文件/目录
- `a` — 新建文件
- `d` — 删除文件
- `r` — 重命名
- `R` — 刷新
- `m` — 修改（移动/复制等）
- `q` — 关闭文件树

### 窗口分屏

窗口操作以 vim 内置 `Ctrl+w` 系列快捷键为主（兼容所有终端），`M-` 系列为辅（需终端支持 Option 键发送 Esc+，详见文末 [Meta 键说明](#meta-键说明)）。

| 快捷键 | 备用键 | 功能 |
|--------|--------|------|
| `Ctrl+w s` | `M-s` | 水平分割 |
| `Ctrl+w v` | `M-v` | 垂直分割 |
| `Ctrl+w q` | `M-q` | 关闭当前窗口 |
| `Ctrl+w h/j/k/l` | `C-h/j/k/l` | 在窗口间移动 |
| `Ctrl+w H/J/K/L` | `C-S-h/j/k/l` | 将窗口移动到指定方向 |
| `Ctrl+w =` | — | 均分窗口大小 |
| `Ctrl+w +` / `Ctrl+w -` | `M-=` / `M--` | 增加/减少窗口高度 |
| `Ctrl+w >` / `Ctrl+w <` | `M-.` / `M-,` | 增加/减少窗口宽度 |
| `Ctrl+w r` | `M-r` | 旋转窗口布局 |
| `Ctrl+w x` | `M-x` | 交换窗口位置 |

### Buffer 管理 (bufferline)

| 快捷键 | 功能 |

|--------|------|
| `gb` | 上一个 buffer |
| `gt` | 下一个 buffer |
| `g<Space>` | 选择 buffer（模糊查找） |
| `g<BS>` | 关闭当前 buffer |
| `gB` | 向左移动 buffer |
| `gT` | 向右移动 buffer |
| `g<Tab>` | 固定/取消固定 buffer |
| `<S-Tab>` | 跳回上次光标位置 |

### 标签页

| 快捷键 | 功能 |
|--------|------|
| `:tabnew` | 新建标签页 |
| `gt` | 下一个标签页 |
| `gT` | 上一个标签页 |

---

## 三、代码编辑

### 自动补全 (nvim-cmp)

输入代码时自动弹出补全菜单。

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+n / Ctrl+p` | 下一个/上一个补全项 |
| `Tab / Shift+Tab` | 下一个/上一个（也会展开代码片段） |
| `Enter` | 确认选中项 |
| `Ctrl+u / Ctrl+d` | 滚动补全文档 |

补全来源：
- **LSP** — 语言服务器智能补全（最多10条）
- **Buffer** — 当前文件中的词（最多8条）
- **Path** — 文件路径补全
- **LuaSnip** — 代码片段
- **rg** — 全文搜索补全
- **Calc** — 数学计算

### 代码片段 (LuaSnip)

在补全菜单中选择带 `~` 标记的项展开代码片段，按 `Tab` 在占位符间跳转。

### 注释 (nvim-comment)

| 快捷键 | 功能 |
|--------|------|
| `gcc` | 注释/取消注释当前行 |
| `gc` | 注释/取消注释选中区域（可视模式） |

### 格式化 (Neoformat + LSP)

| 快捷键 | 功能 |
|--------|------|
| `g=` (普通模式) | LSP 格式化当前 buffer |
| `g=` (可视模式) | Neoformat 格式化选中区域 |
| `F16` | LSP 格式化 |

### 括号包围 (nvim-surround)

| 快捷键 | 功能 |
|--------|------|
| `ys<motion><char>` | 添加包围（如 `ysiw"` 给单词加引号） |
| `ds<char>` | 删除包围（如 `ds"` 删除引号） |
| `cs<char1><char2>` | 改变包围（如 `cs"'` 引号变单引号） |
| `S<char>` (可视模式) | 给选中文本加包围 |

---

## 四、LSP 智能功能

### 代码导航

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 (Telescope) |
| `gD` | 跳转到声明 |
| `gy` | 跳转到类型定义 |
| `gr` | 查找所有引用 |
| `gY` | 查找所有实现 |
| `go` | 头文件/源文件切换 (clangd) |
| `gO` | 水平分屏打开对应文件 |
| `g<C-o>` | 垂直分屏打开对应文件 |

### 代码理解

| 快捷键 | 功能 |
|--------|------|
| `K` | 查看光标下符号的文档 (hover) |
| `gK` | 查看函数签名 |
| `gw` | 代码修复 (code action，自动应用) |
| `gn` | 重命名变量 (IncRename) |
| `gsd` | 查看光标处的诊断信息 |
| `gst` | 查看派生类层级 |
| `gsT` | 查看基类层级 |

### 诊断与问题列表 (Trouble)

| 快捷键 | 功能 |
|--------|------|
| `F9` | 显示所有诊断 |
| `F21` | 显示当前文件诊断 |
| `gss` | 切换诊断列表 |
| `gsl` | 切换编译错误列表 (Quickfix) |
| `F6` | 切换 Quickfix 列表 |
| `gz` | LSP 定义+引用列表 |

### Inlay Hint (类型提示)

| 快捷键 | 功能 |
|--------|------|
| `gsi` | 开关 Inlay Hint |
| `gsu` | 重启 LSP 服务器 |

### 大纲视图 (Aerial)

| 快捷键 | 功能 |
|--------|------|
| `gso` | 打开/关闭代码大纲 |
| `F12` | 同上 |

---

## 五、搜索与跳转

### 模糊搜索 (Telescope)

| 快捷键 (普通模式 `,` = leader) | 功能 |
|--------|------|
| `,l` | 查找文件 |
| `,k` | 全文搜索 (live grep) |
| `,i` | 查找 Git 文件 |
| `,o` | 最近打开的文件 |
| `,b` | 当前 buffer 列表 |
| `,,` | 恢复上次搜索 |
| `,p` | Git 状态 |
| `,m` | 书签 (Marks) |
| `,j` | 跳转列表 |
| `,h` | 帮助文档 |
| `,c` | Neovim 命令 |
| `,q` | Quickfix 列表 |
| `,d` | 文档符号 |
| `,s` | 工作区符号 |
| `,t` | Todo 注释 |

在 Telescope 窗口中：
- `Ctrl+n/p` — 上下移动
- `Ctrl+j/k` — 在预览和输入框间切换
- `Enter` — 打开
- `Ctrl+t` — 在新标签页打开
- `Ctrl+v` — 垂直分屏打开
- `Ctrl+x` — 水平分屏打开

### 字符跳转 (Hop)

| 快捷键 | 功能 |
|--------|------|
| `Space` | 全文跳转：按 Space 后输入目标字符，再按提示字母跳转 |

### 文本对象 (Treesitter)

| 快捷键 | 功能 |
|--------|------|
| `vif` | 选择函数内部 |
| `vaf` | 选择整个函数 |
| `]f` / `[f` | 移动到下一个/上一个函数 |
| `]c` / `[c` | 移动到下一个/上一个类 |

---

## 六、Git 集成

### 行内状态 (Gitsigns)

行号旁显示 `+` / `~` / `-` 标记改动状态。

| 快捷键 (在 Git 改动区域) | 功能 |
|--------|------|
| `]c` / `[c` | 下一个/上一个改动块 |
| `:Gitsigns preview_hunk` | 预览改动 |
| `:Gitsigns reset_hunk` | 撤销改动 |
| `:Gitsigns stage_hunk` | 暂存改动 |

### Git 客户端 (Neogit)

| 快捷键 | 功能 |
|--------|------|
| `F10` | 打开 Neogit（Git 状态界面） |
| `gsg` | 同上 |

在 Neogit 中：
- `s` — Stage 文件
- `S` — Stage 所有
- `u` — Unstage
- `c` — 提交
- `p` — 推送
- `P` — 拉取
- `q` / `F10` — 关闭

### Diff 查看 (diffview)

| 命令 | 功能 |
|--------|------|
| `:DiffviewOpen` | 查看当前改动 |
| `:DiffviewOpen HEAD~1` | 对比上一次提交 |

---

## 七、终端与编译运行

### 内置终端 (ToggleTerm)

| 快捷键 | 功能 |
|--------|------|
| `F8` | 打开/关闭终端 |
| `Ctrl+Shift+t` | 普通模式：发送当前行到终端<br>可视模式：发送选中内容到终端 |
| `jk` / `kj` (终端中) | 退出终端模式回到普通模式 |
| `Esc` (终端中) | 同上 |

### 编译运行 (CMake-Tools)

| 快捷键 | 功能 |
|--------|------|
| `F5` | 编译并运行 |
| `F17` | 停止运行 |
| `F4` | 保存所有文件 |

| 命令模式 | 功能 |
|--------|------|
| `cmr` | CMake: 运行 |
| `cmb` | CMake: 编译 |
| `cmc` | CMake: 生成/配置 |
| `cms` | CMake: 停止 |

如果没有 CMake 项目，F5 会自动尝试 `make`、`./run.sh` 或 platformio。

---

## 八、插件快捷键速查

### 功能区 (F1-F12)

| 按键 | 功能 | 所属插件 |
|------|------|----------|
| `F4` | 全部保存 | 内置 |
| `F5` | 编译运行 | cmake-tools / make |
| `F17 (Shift+F5)` | 停止运行 | cmake-tools |
| `F6` | Quickfix 窗口 | Trouble |
| `F18 (Shift+F6)` | 打开 Quickfix | 内置 |
| `F7` | 文件树 | nvim-tree |
| `F8` | 终端 | toggleterm |
| `F9` | 诊断列表 | Trouble |
| `F21 (Shift+F9)` | 当前文件诊断 | Trouble |
| `F10` | Git 状态 | Neogit |
| `F16` | 格式化代码 | LSP |
| `F12` | 代码大纲 | Aerial |
| `Ins` | 禅模式 | ZenMode |

### g 前缀系列 (编辑/导航)

| 快捷键 | 功能 |
|--------|------|
| `g=` | 格式化 |
| `gw` | 代码修复 |
| `gn / gN` | 重命名（自动填入/手动输入） |
| `gd` | 跳转定义 |
| `gD` | 跳转声明 |
| `gy` | 跳转类型定义 |
| `gr` | 查找引用 |
| `gY` | 查找实现 |
| `go` | 切换头文件/源文件 |
| `gO` | 水平分屏打开对应文件 |
| `gK` | 函数签名 |
| `gcc` | 注释切换 |
| `gs{s,d,l,g,o,p,i,u,t,T}` | 各种 LSP 辅助功能 |

### 系统剪贴板

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+Insert` | 复制到系统剪贴板 |
| `Shift+Insert` | 从系统剪贴板粘贴 |

---

## 九、配色切换

### 内置配色方案

```vim
" 深色主题（推荐）
:colorscheme tokyonight-night    " 默认 - 深沉优雅的暗色
:colorscheme tokyonight-storm    " 深蓝调
:colorscheme tokyonight-moon     " 深紫调
:colorscheme catppuccin-mocha    " 暖色暗色
:colorscheme catppuccin-macchiato " 中暗色
:colorscheme catppuccin-frappe   " 柔和暗色
:colorscheme gruvbox             " 复古暖色
:colorscheme nord                " 冷蓝调

" 浅色主题
:colorscheme tokyonight-day      " 干净亮色
:colorscheme catppuccin-latte    " 温暖亮色
```

### 切换透明背景

如果你使用透明终端，在 nvim 中执行：

```vim
:lua require'archvim.options'.transparent_color = true
:colorscheme tokyonight-night  " 重新加载主题
```

保存设置（永久生效）：

```vim
:lua require'archvim.options'.transparent_color = true
```

### 安装更多 Treesitter 语法高亮

```vim
:TSInstall html css javascript typescript rust go markdown yaml toml
```

---

## 快速上手总结

如果你是 vim 新手，记住这些就够了：

1. **移动**: `h j k l` / `w b` / `gg G`
2. **编辑**: `i` 开始输入 / `jk` 或 `Esc` 退出 / `:w` 保存
3. **补全**: 输入时自动弹出，`Enter` 确认
4. **文件树**: `F7` 打开/关闭
5. **终端**: `F8` 打开/关闭
6. **编译运行**: `F5` 一键编译运行
7. **查找文件**: `,l` 打开模糊搜索
8. **代码跳转**: `gd` 跳转到定义
9. **Git**: `F10` 打开 Git 管理界面
10. **退出 vim**: `jk` → `:qa!`

---

---

## Meta 键说明

`M-` 表示 **Meta 键**，在 macOS 上即 **Option (⌥) 键**。

### 为什么 M- 快捷键可能不生效？

终端模拟器需要正确配置才能让 Option 键发送 `Esc+` 前缀序列，vim/neovim 才能识别为 Meta 组合键。

**iTerm2 设置方法：**
1. 打开 iTerm2 → Settings（`⌘,`）
2. 进入 Profiles → Keys → General
3. 将 **Left Option Key** 和 **Right Option Key** 设置为 **Esc+**

**其他终端：**
- **Terminal.app**：Preferences → Profiles → Keyboard → Use Option as Meta key
- **Alacritty**：配置文件中设置 `option_as_alt: true`
- **Kitty**：默认支持，无需额外配置
- **WezTerm**：配置 `send_composed_key_when_left_alt_is_pressed = false`

### M- 快捷键 vs 内置快捷键

所有 `M-` 快捷方式都有对应的 vim 内置快捷键。如果 Option 键配置不便，完全可以使用内置方式，功能一致：

| M- 快捷方式 | 等效内置方式 | 功能 |
|------------|-------------|------|
| `M-s` | `Ctrl+w s` | 水平分割 |
| `M-v` | `Ctrl+w v` | 垂直分割 |
| `M-q` | `Ctrl+w q` 或 `q` | 关闭窗口 |
| `M-z` | `zz` | 居中当前行 |
| `M-=/M--` | `Ctrl+w +/-` | 调整窗口高度 |
| `M-,/M-.` | `Ctrl+w >/<` | 调整窗口宽度 |
| `M-r` | `Ctrl+w r` | 旋转窗口布局 |
| `M-x` | `Ctrl+w x` | 交换窗口位置 |

当前配置已设置 `ttimeoutlen=100`（在 options.lua 中），确保 Meta 键有足够的识别时间。

---

*手册生成于 2026-07-06 | 基于 archibate/vimrc (nvim-2) | gruvbox 配色*
