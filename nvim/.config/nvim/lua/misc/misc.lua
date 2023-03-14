--
-- Auto reload waybar when a change occurs in the configuration directory, even if the directory is symlinked due to dotfile management
--

-- Get the path to the configuration directory
local config_path = os.getenv("HOME") .. "/.config/waybar"

-- Try to resolve the symlink
local symlink_path = io.open(config_path):read("*l")
local resolved_path = symlink_path and require("lfs").attributes(symlink_path, "ino") or config_path

if resolved_path then
	-- Set up the file watcher
	local uv = require("luv")
	local watcher = uv.new_fs_event()
	watcher:start(resolved_path, { recursive = true }, function()
		-- Reload Waybar when the file changes
		os.execute("killall -SIGUSR2 waybar")
	end)
else
	print("Could not resolve symlink, using default path")
end
