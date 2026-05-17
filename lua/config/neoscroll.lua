local neoscroll = prequire("neoscroll")
if not neoscroll then
  return
end

neoscroll.setup()

local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 80 }) end,
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 80 }) end,
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 80 }) end,
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 80 }) end,
  ["zt"]    = function() neoscroll.zt({ half_win_duration = 150 }) end,
  ["zz"]    = function() neoscroll.zz({ half_win_duration = 150 }) end,
  ["zb"]    = function() neoscroll.zb({ half_win_duration = 150 }) end,
}
for key, fn in pairs(keymap) do
  vim.keymap.set({ "n", "v", "x" }, key, fn, { silent = true, desc = "Neoscroll " .. key })
end
