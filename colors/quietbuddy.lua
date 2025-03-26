require("colorbuddy").colorscheme("quietbuddy", false, { disable_defaults = true })

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles
local HSL = require("colorbuddy.data.hsl")

local function l(lightness)
	return HSL:new(0, 0, lightness)
end

local cl_count = 0
local function cl(lightness)
	local key = string.format("autogenerated_%d", cl_count)
	cl_count = cl_count + 1
	Color.new(key, l(lightness))
	return c[key]
end

local function link_all(linked_group, names)
	for i = 1, #names do
		Group.link(names[i], linked_group)
	end
end

-- Group.new = function(name, fg, bg, style, guisp, blend)
-- Group.link = function(name, linked_group)

Color.new("accent1", "#8D8CD8")
Color.new("accent2", "#33994E")
Color.new("match", "#FFAF00")

Color.new("hint", "#1971FF")
Color.new("info", "#00B06B")
Color.new("warn", "#F6AA00")
Color.new("error", "#FF4B00")

Group.new("Normal", cl(0.9))
Group.new("Comment", c.accent2)

Group.new("Search", c.match)
Group.new("CurSearch", c.match, nil, s.reverse)
Group.new("Visual", nil, cl(0.3))
Group.new("LineNr", cl(0.4))
Group.new("CursorLineNr", cl(0.8))
Group.new("Pmenu", c.none, cl(0.3))
Group.new("ColorColumn", c.none, cl(0.1))
Group.new("Constant", c.accent1)

Group.new("CursorLine", nil, cl(0.1))
Group.link("CursorColumn", g.CursorLine)

Group.new("Delimiter", cl(0.6))
Group.new("NonText", cl(0.25))

link_all(g.Constant, {
	"Boolean",
	"Character",
	"Float",
	"Number",
	"String",
})

link_all(g.Comment, {
	"Tag",
})

link_all(g.Delimiter, {
	"Keyword",
})

link_all(g.NonText, {
	"EndOfBuffer",
	"SpecialKey",
})

link_all(g.Visual, {
	"PmenuExtraSel",
	"PmenuKindSel",
	"VisualNOS",
})

link_all(g.Search, {
	"IncSearch",
})

link_all(g.CurSearch, {
	"PmenuSel",
})

link_all(g.Normal, {
	"Type",
	"StorageClass",
	"Structure",
	"Statement",
	"Conceal",
	"Conditional",
	"Cursor",
	"CursorIM",
	"Debug",
	"Define",
	"DiffAdd",
	"DiffChange",
	"DiffDelete",
	"DiffText",
	"Directory",
	"Error",
	"ErrorMsg",
	"Exception",
	"FoldColumn",
	"Folded",
	"Function",
	"Identifier",
	"Ignore",
	"Include",
	"Label",
	"Macro",
	"MatchParen",
	"MessageWindow",
	"ModeMsg",
	"MoreMsg",
	"Operator",
	"PmenuExtra",
	"PmenuKind",
	"PmenuSbar",
	"PmenuThumb",
	"PopupNotification",
	"PreCondit",
	"PreProc",
	"Question",
	"QuickFixLine",
	"Repeat",
	"SignColumn",
	"Special",
	"SpecialChar",
	"SpellBad",
	"SpellCap",
	"SpellLocal",
	"SpellRare",
	"StatusLine",
	"StatusLineNC",
	"StatusLineTerm",
	"StatusLineTermNC",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"Terminal",
	"Title",
	"Todo",
	"ToolbarButton",
	"ToolbarLine",
	"Typedef",
	"Underlined",
	"VertSplit",
	"WarningMsg",
	"WildMenu",
	"debugBreakpoint",
	"debugPC",
	"lCursor",
})

-- Treesitter
Group.new("TreesitterContext")
Group.new("TreesitterContextBottom", nil, nil, s.underline)
Group.new("TreesitterContextLineNumberBottom", nil, nil, s.underline)

Group.new("@markup.heading", c.accent2, nil, s.bold)
Group.new("@markup.list.markdown", c.accent1, nil, s.bold)

-- LSP
Group.new("DiagnosticHint", c.hint, nil, s.bold)
Group.new("DiagnosticInfo", c.info, nil, s.bold)
Group.new("DiagnosticWarn", c.warn, nil, s.bold)
Group.new("DiagnosticError", c.error, nil, s.bold)
Group.link("DiagnosticUnnecessary", "Normal")

-- Telescope
Group.new("TelescopeMatching", c.match)

-- Mini
Group.link("MiniIndentscopeSymbol", g.Delimiter)

-- Nvim-tree
Group.new("Directory", c.accent1)
