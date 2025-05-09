return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "G",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Glog",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
  },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>", desc = "Git status (fugitive)" },
  },
}
