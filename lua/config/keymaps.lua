-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://githubecom/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set
local keymap = vim.keymap
local del = vim.keymap.del
--
del("n", "<S-h>")
del("n", "<S-l>")
--
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("v", "H", "^")
keymap.set("v", "L", "$")

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "移动到左边窗口", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "移动到下边窗口", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "移动到上边窗口", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "移动到右边窗口", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增减窗口高度" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗口高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "减少窗口宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "增加窗口宽度" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "向下移动" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "向上移动" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "向下移动" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "向上移动" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "向下移动" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "向上移动" })

-- buffers
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "上一个缓冲区" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "下一个缓冲区" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "上一个缓冲区" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "下一个缓冲区" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "切换到其他缓冲区" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "切换到其他缓冲区" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "退出并清除搜索" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "重绘 / 清除搜索高亮 / 差异更新" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "下一个搜索结果" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "下一个搜索结果" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "下一个搜索结果" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "上一个搜索结果" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "上一个搜索结果" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "上一个搜索结果" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "保存文件" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "新文件" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "位置列表" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "快速修复列表" })

map("n", "[q", vim.cmd.cprev, { desc = "上一个快速修复" })
map("n", "]q", vim.cmd.cnext, { desc = "下一个快速修复" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  Util.format({ force = true })
end, { desc = "格式化代码" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "行诊断" })
map("n", "]d", diagnostic_goto(true), { desc = "下一个诊断" })
map("n", "[d", diagnostic_goto(false), { desc = "上一个诊断" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "下一个错误" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "上一个错误" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "下一个警告" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "上一个警告" })

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", function() Util.format.toggle() end, { desc = "开关自动格式化(全局)" })
map("n", "<leader>uF", function() Util.format.toggle(true) end, { desc = "开关自动格式化(缓冲区)" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "开关自动换行" })
map("n", "<leader>uL", function() Util.toggle("relativenumber") end, { desc = "开关相对行号" })
map("n", "<leader>ul", function() Util.toggle.number() end, { desc = "开关行号" })
map("n", "<leader>ud", function() Util.toggle.diagnostics() end, { desc = "开关诊断" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  map( "n", "<leader>uh", function() Util.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
end
map("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "切换语法高亮" })

-- lazygit
map("n", "<leader>gg", function() Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "打开LazyGit(项目根目录)" })
map("n", "<leader>gG", function() Util.terminal({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "打开LazyGit(cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "退出全部" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- LazyVim Changelog
map("n", "<leader>L", function() Util.news.changelog() end, { desc = "LazyVim修改日志" })

-- floating terminal
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "终端(root dir)" })
map("n", "<leader>fT", function() Util.terminal() end, { desc = "终端(cwd)" })
map("n", "<c-/>", lazyterm, { desc = "终端(root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "其他窗口", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "删除窗口", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "向下分割窗口", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "向右分割窗口", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "向下分割窗口", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "向右分割窗口", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "最后一个Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "第一个Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "新Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "下一个Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "关闭Tab" })

-- rest.nvim
map("n", "<leader>rr", "<Plug>RestNvim", { desc = "运行光标下的请求" })
map("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "预览curl命令" })
map("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "重新运行最后一个请求" })

-- quick quit
map("n", "qq", ":q<CR>", { desc = "快速退出" })

-- dbui
map("n", "<leader>su", ":DBUIToggle<CR>", { desc = "打开数据库界面"})
map("v", "<leader>su", ":DBUIToggle<CR>", { desc = "打开数据库界面"})

-- 覆盖默认设置
-- vim.keymap.del({ "n", "i", "v" }, "<C-Down>")
-- vim.keymap.del({ "n", "i", "v" }, "<C-Up>")
-- translate
map("n", "<C-t>", "<cmd>Translate ZH<CR>", { desc="翻译成中文"})
map("v", "<C-t>", "<cmd>Translate ZH<CR>", { desc="翻译成中文"})
map("n", "<A-h>", "^", { desc="移到句首"})
map("n", "<A-l>", "$", { desc="移到句尾"})

map('i', '<A-j>', '<Down>', { desc= ""})  -- 在insert模式向下移动光标
map('i', '<A-k>', '<Up>', { desc= ""})    -- 在insert模式向上移动光标
map('i', '<A-h>', '<Left>', { desc= ""})  -- 在insert模式向左移动光标
map('i', '<A-l>', '<Right>', { desc= ""}) -- 在insert模式向右移动光标

map('n', '<A-u>', '6k', { desc= ""})  -- 在insert模式向下移动光标
map('n', '<A-d>', '6j', { desc= ""})    -- 在insert模式向上移动光标
map('n', '<A-h>', '<Left>', { desc= ""})  -- 在insert模式向左移动光标
map('n', '<A-l>', '<Right>', { desc= ""}) -- 在insert模式向右移动光标

-- 全选
map('n', '<C-a>', '<Esc><Esc>ggVG', { desc= "全选"})
map('v', '<C-a>', '<Esc><Esc>ggVG', { desc= "全选"})
map('i', '<C-a>', '<Esc><Esc>ggVG', { desc= "全选"})
