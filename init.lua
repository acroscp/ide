-- Config Path ~/.config/nvim/init.lua
vim.opt.incsearch = false
vim.opt.hlsearch = true
local kc = {noremap = true}
local kcs = {noremap = true, silent = true}
vim.keymap.set('n', '<F5>', ':vne<BAR>te<CR>', kc)
vim.keymap.set('n', '<C-p>', ':FZF<CR>', kc)
vim.keymap.set('n', '<F12>', ':set nu!<CR>', kc)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', kc)
vim.keymap.set({'Vimenter'}, {pattern = '*', command = 'NoMatchParen'})
vim.keymap.set({'FileType'}, {pattern = 'php', command = 'set sw=4 ts=4 et'})
vim.keymap.set({'FileType'}, {pattern = {'markdown','html','yaml','javascript'}, command = 'set sw=2 ts=2 et'}
)

-- Plugin Path ~/.local/share/nvim/site/pack/packer/start/packer.nvim
require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        -- file name fuzzy searh
        use 'junegunn/fzf'

        -- text support
        use 'tpope/vim-surround'
        use 'jiangmiao/auto-pairs'

        -- coding help
        use {'mattn/emmet-vim', ft = {'css', 'sass', 'vue'}, cmd = 'EmmetInstall'}
        use {'tpope/vim-fugitive', ft = {'php'}}
        use {'vim-syntastic/syntastic', ft = {'php'}}

        -- coding snip
        use {'L3MON4D3/LuaSnip', tag = 'v2.*'}
        use 'rafamadriz/friendly-snippets'

        -- syntax enhance
        -- use {'pangloss/vim-javascript', ft = {'javascript'}}
        -- use {'posva/vim-vue', ft = {'vue'}}
end)

-- From postva/vim-vue
-- vim.g.vue_pre_processors = {}

-- From vim-syntastic/syntastic
vim.api.nvim_create_user_command('PHPLint', function(params)
        vim.cmd('SyntasticCheck')
        if vim.v.shell_error ~~= 0 then
                print('format error')
                return
        end
end, {})

vim.g.syntastic_mode_map = {
        mode = 'passive',
}

vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_wq = 0

vim.api.nvim_create_user_command('PHPCSFix', function(params)
        vim.cmd('silent ! php-cs-fixer-v3.phar fix %')
        if vim.v.shell_error == 0 then
                vim.cmd('edit')
        else
                print('failed')
        end
end, {})

vim.api.nvim_create_user_autocmd('BufWritePost', {pattern = '*.php', callback = function()
        local fn = vim.fn.expand('%:t')
        if not fn:match('%.blade.php') then
                vim.cmd('PHPLint')
        end
end
})

require('luasnip.loaders.from_vscode').lazy_load()
-- Custom key Lua snip
local ls = require('luasnip')
vim.keymap.set({'i'}, '<C-L>', function() ls.expand() end, kcs)
vim.keymap.set({'i', 's'}, '<Tab>', function() ls.jump( 1) end, kcs)
vim.keymap.set({'i', 's'}, '<S-Tab>', function() ls.jump( -1) end, kcs)
