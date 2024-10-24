require("config.lazy")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.keymap.set('n', '<S-d>', 'yyp', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.opt.termguicolors = true

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)  -- Expandir snippets
        end,
    },
    mapping = {
        ['<M-Down>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<M-Up>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ["<C-Space>"] = cmp.mapping.complete(),   -- Completar
        ["<C-e>"] = cmp.mapping.close(),          -- Cerrar el menú de completado
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
    },
    sources = {
        { name = "nvim_lsp" },  -- Fuente LSP
        { name = "buffer" },     -- Fuente del buffer
        { name = "path" },       -- Fuente de rutas
        { name = "luasnip" },    -- Fuente de snippets
    },
})

-- Opcional: configurar el autocompletado en la línea de comandos
cmp.setup.cmdline(':', {
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "cmdline" },
    },
})
