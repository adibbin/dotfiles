return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    cmd = 'Telescope',
    keys = {
        {
            '/',
            function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            desc = '[/] Fuzzily search in current buffer'
        },

        { '<leader><space>', '<cmd>Telescope buffers<cr>',     desc = '[ ] buffers' },

        -- Search
        { '<leader>sf',      '<cmd>Telescope find_files<cr>',  desc = '[s]earch [f]iles' },
        { '<leader>sg',      '<cmd>Telescope live_grep<cr>',   desc = '[s]earch [g]rep' },
        { '<leader>sh',      '<cmd>Telescope help_tags<cr>',   desc = '[s]earch [h]elp' },
        { '<leader>sk',      '<cmd>Telescope keymaps<cr>',     desc = '[s]earch [k]eymaps' },
        { '<leader>so',      '<cmd>Telescope oldfiles<cr>',    desc = '[s]earch [o]ld files' },
        { '<leader>sr',      '<cmd>Telescope resume<cr>',      desc = '[s]earch [r]esume' },
        { '<leader>ss',      '<cmd>Telescope builtin<cr>',     desc = '[s]earch [r]esume' },
        { '<leader>sw',      '<cmd>Telescope grep_string<cr>', desc = '[s]earch [w]ord' },

        -- Git
        { '<leader>gc',      '<cmd>Telescope git_commits<cr>', desc = '[g]it [c]ommits' },
        { '<leader>gf',      '<cmd>Telescope git_files<cr>',   desc = '[g]it [f]iles' },
    },
    opts = {
        defaults = {
            file_ignore_ratterns = {
                'node_modules',
                'redoc.standalone.js'
            },
        },
        pickers = {
            buffers = {
                sort_lastused = true,
                sort_mru = true,
            },
        }
    }
}
