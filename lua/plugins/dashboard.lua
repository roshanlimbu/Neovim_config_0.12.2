local ok, snacks = pcall(require, "snacks")
if not ok then
  return
end


snacks.setup({
  dashboard = {
    enabled = true,

    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },

    preset = {
      header = [[
      ]],
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":FzfLua live_grep" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":FzfLua oldfiles" },
        { icon = " ", key = "c", desc = "Config", action = ":e ~/.config/nvim12/init.lua" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
  },
})
