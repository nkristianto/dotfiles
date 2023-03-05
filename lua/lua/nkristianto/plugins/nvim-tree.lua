local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended setting from nvim-tree doc
vim.g.loaded = 1
vim.g.loaded_netrwlugin = 1

nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        }
      }
    }
  }
})
