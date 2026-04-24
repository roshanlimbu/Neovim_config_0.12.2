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
            NNNNNNNN        NNNNNNNN                                  VVVVVVVV           VVVVVVVV iiii
            N:::::::N       N::::::N                                  V::::::V           V::::::Vi::::i
            N::::::::N      N::::::N                                  V::::::V           V::::::V iiii
            N:::::::::N     N::::::N                                  V::::::V           V::::::V
            N::::::::::N    N::::::N    eeeeeeeeeeee       ooooooooooo V:::::V           V:::::Viiiiiii    mmmmmmm    mmmmmmm
            N:::::::::::N   N::::::N  ee::::::::::::ee   oo:::::::::::ooV:::::V         V:::::V i:::::i  mm:::::::m  m:::::::mm
            N:::::::N::::N  N::::::N e::::::eeeee:::::eeo:::::::::::::::oV:::::V       V:::::V   i::::i m::::::::::mm::::::::::m
            N::::::N N::::N N::::::Ne::::::e     e:::::eo:::::ooooo:::::o V:::::V     V:::::V    i::::i m::::::::::::::::::::::m
            N::::::N  N::::N:::::::Ne:::::::eeeee::::::eo::::o     o::::o  V:::::V   V:::::V     i::::i m:::::mmm::::::mmm:::::m
            N::::::N   N:::::::::::Ne:::::::::::::::::e o::::o     o::::o   V:::::V V:::::V      i::::i m::::m   m::::m   m::::m
            N::::::N    N::::::::::Ne::::::eeeeeeeeeee  o::::o     o::::o    V:::::V:::::V       i::::i m::::m   m::::m   m::::m
            N::::::N     N:::::::::Ne:::::::e           o::::o     o::::o     V:::::::::V        i::::i m::::m   m::::m   m::::m
            N::::::N      N::::::::Ne::::::::e          o:::::ooooo:::::o      V:::::::V        i::::::im::::m   m::::m   m::::m
            N::::::N       N:::::::N e::::::::eeeeeeee  o:::::::::::::::o       V:::::V         i::::::im::::m   m::::m   m::::m
            N::::::N        N::::::N  ee:::::::::::::e   oo:::::::::::oo         V:::V          i::::::im::::m   m::::m   m::::m
            NNNNNNNN         NNNNNNN    eeeeeeeeeeeeee     ooooooooooo            VVV           iiiiiiiimmmmmm   mmmmmm   mmmmmm
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
