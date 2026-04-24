local ok_context, context = pcall(require, "ts_context_commentstring")
if ok_context then
  context.setup({
    enable_autocmd = false,
  })
end

local ok_comment, comment = pcall(require, "Comment")
if not ok_comment then
  return
end

comment.setup({
  pre_hook = ok_context
      and require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    or nil,
})
