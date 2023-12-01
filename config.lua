-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- Config
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Make nvimtree a bit bigger
lvim.builtin.nvimtree.setup.view.width = 50


-- Center screen after jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center screen after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- prevent yanked text to be replaced on paste
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Disable moving lines when exiting exiting mode
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-k>"] = false

-- Enable incremental selection
lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
}


-- Setup LSP
lvim.lsp.automatic_servers_installation = false
-- add intelephense to skipped_servers list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })
-- remove phpactor from skipped_servers list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "phpactor"
end, lvim.lsp.automatic_configuration.skipped_servers)


-- Install plugins
lvim.plugins = {
    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Git related plugins
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    -- Sync nvim and tmux splits
    { 'christoomey/vim-tmux-navigator' },
    -- Phpactor as plugin
    { 'phpactor/phpactor' },
}
