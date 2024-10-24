return {
    {"nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    'c',
                    'cpp',
                    'java',
                    'lua',
                    'javascript',
                    'css',
                    'html',
                    'bash',
                    'typescript'
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                fold = {
                    enable = true,
                    disable = {},
                    -- Puedes especificar lenguajes aquí si no quieres plegado automático en algunos
                },
                autotag = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,  -- Resalta no solo (), sino también {}, []
                    max_file_lines = 1000, -- No se aplica a archivos demasiado grandes
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                playground = {  -- Explorar y depurar el árbol sintáctico
                    enable = true,
                    updatetime = 25,  -- Tiempo de actualización para el árbol
                    persist_queries = false,  -- No mantener consultas entre sesiones
                },
                sync_install = false,
                modules = {},
                auto_install = true,
                ignore_install = {}
            })
        end
    },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
}
