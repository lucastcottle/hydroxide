local config = require("hydroxide.config")

local M = {}

-- Hydroxide palette: oxide hues, washed out toward no-clown-fiesta's
-- muted gray (#AFAFAF). Monochrome extremes (background blacks and
-- foreground whites) are kept at full oxide contrast; only the
-- chromatic accents and mid-grays are washed.
local palette = {
	-- Surface colors: blacks at original oxide contrast
	mantle = "#121212", -- oxide original
	base = "#161616", -- oxide original
	surface0 = "#272727", -- subtle backgrounds, cursor, visual
	surface1 = "#323232", -- active selections
	surface2 = "#404040", -- borders, lines

	-- Text colors: whites at original oxide contrast
	bright_text = "#eeeeee", -- oxide original
	text = "#cecece", -- oxide original
	subtext0 = "#a9a9a9", -- secondary text
	subtext1 = "#808080", -- muted text
	subtext2 = "#6e6e6e", -- comments (lifted from #555555 for readability)

	-- Accent colors (oxide blended ~38% toward #AFAFAF)
	red = "#d58b87", -- functions, errors
	orange = "#d09362", -- constants, numbers, warnings
	yellow = "#bba142", -- attention, todo
	lime = "#a3ab56", -- headings, positive accents
	green = "#7bb37f", -- strings, success
	teal = "#42b6ac", -- preproc, regex
	sky = "#42b1c7", -- types, readonly, URLs
	blue = "#67a9da", -- properties, info, directories
	purple = "#a09bdc", -- keywords, storage
	pink = "#c18fc4", -- tags, special strings

	-- Bright accents (blended ~38% toward #CFCFCF)
	bright_red = "#edada8",
	bright_orange = "#edb284",
	bright_yellow = "#dbc16d",
	bright_lime = "#c3cb7c",
	bright_green = "#9bd49d",
	bright_teal = "#4fd7cc",
	bright_sky = "#4fd3e9",
	bright_blue = "#93c9ed",
	bright_purple = "#bfbded",
	bright_pink = "#d8a5db",

	-- Diff backgrounds (desaturated, kept dark)
	diff_delete = "#3d2f2d", -- muted red wash
	diff_add = "#2c352c", -- muted green wash
	diff_change = "#2a3540", -- muted blue wash

	-- Special
	none = "NONE",
}

function M.setup(opts)
	opts = config.extend(opts)

	-- Start with base palette
	local colors = {}
	for k, v in pairs(palette) do
		colors[k] = v
	end

	-- Apply transparency if enabled
	if opts.transparent then
		colors.base = "NONE"
		colors.mantle = "NONE"
	end

	-- Allow user color overrides
	if opts.on_colors then
		colors = opts.on_colors(colors) or colors
	end

	return {
		colors = colors,
		config = opts,
	}
end

return M
