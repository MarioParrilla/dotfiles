return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<S-s>', builtin.find_files, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    }
}
