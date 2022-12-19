-- import which-key plugin safely
local status_which_key, which_key = pcall(require, "which-key")
if not status_which_key then
	return
end

which_key.setup({})
