require"pears".setup(function(conf)
  conf.pair("`",{
    filetypes = {
      exclude = {"q"} 
    }
  })
end)
require'colorizer'.setup()
require('kommentary.config').configure_language("q", {
    single_line_comment_string = "/",
    prefer_single_line_comments = true,
})
require('kommentary.config').configure_language("fish", {
    single_line_comment_string = "#",
    prefer_single_line_comments = true,
})
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>//", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>/", "<Plug>kommentary_visual_default", {})
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" }, -- `phpdoc` requires NPM to be installed from grammar.j
  highlight = {
    enable = true, 
    disable = function(lang, bufnr) -- Disable in large C++ buffers
      return lang == "org" or vim.api.nvim_buf_line_count(bufnr) > 10000
    end,
    additional_vim_regex_highlighting = {'org'}
  }
}
require('telescope').setup {
  defaults = {file_ignore_patterns = {"node_modules", "dist"}}
}
require("telescope").load_extension "file_browser"
---- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
--local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
  disable_netrw = false,
  hijack_netrw = false,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
    enable = false,
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
  system_open = {cmd = nil, args = {}},
  filters = {dotfiles = false, custom = {}},
  git = {enable = true, ignore = true, timeout = 500},
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {custom_only = false, list = {}},
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      list = {
        { key = "O",                        action = "vsplit" },
        { key = "d",                        action = "trash" }
      }
    }
  },
  trash = {cmd = "trash", require_confirm = true},
  actions = {change_dir = {global = false}}
}
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/org/*'},
  org_default_notes_file = '~/org/refile.org',
  org_agenda_templates={ t = { description = 'Task', template = '* TODO %?\n %u', target = '~/org/todo.org' },
  n = { description = 'Notes', template = '* %U %?\n %a', target = '~/org/notes.org' },
}
})
