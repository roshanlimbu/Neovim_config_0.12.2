local ok_ctx, ts_ctx = pcall(require, "ts_context_commentstring")
if ok_ctx then
  ts_ctx.setup({
    enable_autocmd = false,
  })
end

local ok, comment = pcall(require, "mini.comment")
if not ok then
  return
end

comment.setup({
  options = {
    custom_commentstring = function()
      local ok_internal, internal = pcall(require, "ts_context_commentstring.internal")
      if ok_internal then
        return internal.calculate_commentstring() or vim.bo.commentstring
      end
      return vim.bo.commentstring
    end,
  },
})
