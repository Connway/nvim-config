local function GetTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function (prompt_bufnr, map)
      local actions = require "telescope.actions"
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require "telescope.actions.state"
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if (filename == nil) then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end
  }
end

require("neo-tree").setup({
   source_selector = {
        winbar = true,
        statusline = false
    },
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
        "document_symbols",
    },
    diagnostics = {
        auto_preview = { -- May also be set to `true` or `false`
            enabled = false, -- Whether to automatically enable preview mode
            preview_config = {}, -- Config table to pass to auto preview (for example `{ use_float = true }`)
            event = "neo_tree_buffer_enter", -- The event to enable auto preview upon (for example `"neo_tree_window_after_open"`)
        },
        bind_to_cwd = true,
        diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
                                         -- "position" means diagnostic items are sorted strictly by their positions.
                                         -- May also be a function.
        follow_current_file = { -- May also be set to `true` or `false`
            enabled = true, -- This will find and focus the file in the active buffer every time
            always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file
            expand_followed = true, -- Ensure the node of the followed file is expanded
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            leave_files_open = false, -- `false` closes auto expanded files, such as with `:Neotree reveal`
        },
        group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
        group_empty_dirs = true, -- when true, empty directories will be grouped together
        show_unloaded = true, -- show diagnostics from unloaded buffers
        refresh = {
            delay = 100, -- Time (in ms) to wait before updating diagnostics. Might resolve some issues with Neovim hanging.
            event = "vim_diagnostic_changed", -- Event to use for updating diagnostics (for example `"neo_tree_buffer_enter"`)
                                          -- Set to `false` or `"none"` to disable automatic refreshing
            max_items = 10000, -- The maximum number of diagnostic items to attempt processing
                               -- Set to `false` for no maximum
        },
    },

    close_if_last_window = true,

    filesystem = {
        window = {
            mappings = {
                --["tf"] = "telescope_find",
                --["tg"] = "telescope_grep",
            }
        }
    },

    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
            end
        }
    },

    commands = {
      telescope_find = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require('telescope.builtin').find_files(GetTelescopeOpts(state, path))
      end,
      telescope_grep = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require('telescope.builtin').live_grep(GetTelescopeOpts(state, path))
      end,
    },
})

vim.keymap.set(
    'n',
    '<leader>nf',
    function()
        require("neo-tree.command").execute({
            toggle = true,
            source = "filesystem",
            position = "float",
        })
    end,
    { desc = 'Toggle [N]eotree with [f]ilesystem view' }
)

vim.keymap.set(
    'n',
    '<leader>nb',
    function()
        require("neo-tree.command").execute({
            toggle = true,
            source = "buffers",
            position = "float",
        })
    end,
    { desc = 'Toggle [N]eotree with [b]uffers view' }
)

vim.keymap.set(
    'n',
    '<leader>ng',
    function()
        require("neo-tree.command").execute({
            toggle = true,
            source = "git_status",
            position = "float",
        })
    end,
    { desc = 'Toggle [N]eotree with [g]it view' }
)

vim.keymap.set(
    'n',
    '<leader>nd',
    function()
        require("neo-tree.command").execute({
            toggle = true,
            source = "diagnostics",
            position = "bottom",
        })
    end,
    { desc = 'Toggle [N]eotree with [d]iagnostics view' }
)

