local ok, sym = pcall(require, "symbol-usage")
if not ok then return end

sym.setup()
