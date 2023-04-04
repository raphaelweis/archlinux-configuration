local telescopeBorderless = function(flavor)
	local cp = require("catppuccin.palettes").get_palette(flavor)

	return {
		TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
		TelescopeSelectionCaret = { fg = cp.lavender, bg = cp.base },
		TelescopeMatching = { fg = cp.lavender },
		TelescopeNormal = { bg = cp.mantle },
		TelescopeSelection = { fg = cp.blue, bg = cp.base },
		TelescopeMultiSelection = { fg = cp.text, bg = cp.mantle },

		TelescopeTitle = { fg = cp.green, bg = cp.mantle },
		TelescopePreviewTitle = { fg = cp.red, bg = cp.mantle },
		TelescopePromptTitle = { fg = cp.mauve, bg = cp.mantle },

		TelescopePromptNormal = { fg = cp.lavender, bg = cp.mantle },
		TelescopePromptBorder = { fg = cp.mantle, bg = cp.mantle },
	}
end
return telescopeBorderless()
