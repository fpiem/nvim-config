local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neo_tree.setup({
  default_component_configs = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
  window = {
    width = 35,
    mappings = {
      ["l"] = "open",
      ["w"] = "open_with_window_picker",
      ["h"] = "close_node",
    }
  }
})


vim.keymap.set("n", "<leader>e", ":NeoTreeRevealToggle<CR>", { noremap = true, silent = true, desc = "Toggle the file tree" })

