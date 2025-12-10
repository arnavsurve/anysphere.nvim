-- Anysphere Neovim Theme
-- Based on Cursor Dark by Anysphere
-- Author: Arnav Surve

local M = {}

M.colors = {
	-- Base colors
	bg = "#1A1A1A",
	bg_dark = "#141414",
	bg_highlight = "#292929",
	bg_visual = "#303030",
	bg_search = "#38474C",

	-- Foreground colors
	fg = "#D8DEE9",
	fg_dark = "#D6D6DD",
	fg_muted = "#CCCCCC",
	fg_disabled = "#505050",

	-- Border colors
	border = "#252525",
	border_focused = "#88C0D0",
	border_variant = "#2A2A2A",

	-- UI elements
	cursor = "#FFFFFF",
	cursorline = "#292929",
	line_nr = "#505050",
	line_nr_active = "#FFFFFF",
	scrollbar = "#404040",

	-- Syntax colors
	comment = "#6D6D6D",
	keyword = "#83D6C5",
	operator = "#83D6C5",
	string = "#E394DC",
	number = "#EBC88D",
	func = "#EFB080",
	type = "#87C3FF",
	type_builtin = "#81D2CE",
	property = "#81D2CE",
	variable = "#D6D6DD",
	variable_param = "#F8C762",
	variable_special = "#C1808A",
	constant = "#8A8A8A",
	attribute = "#AAA0FA",
	tag = "#FAD075",
	punctuation = "#D6D6DD",
	punctuation_bracket = "#FFD602",
	preproc = "#A8CC7C",
	constructor = "#EFB080",
	regex = "#F8C762",
	emphasis = "#83D6C5",
	emphasis_strong = "#F8C762",
	link_text = "#81A1C1",
	link_uri = "#88C0D0",

	-- Diagnostic colors
	error = "#BF616A",
	warning = "#EBCB8B",
	info = "#88C0D0",
	hint = "#696969",
	success = "#A3BE8C",

	-- Git colors
	git_add = "#A3BE8C",
	git_change = "#EBCB8B",
	git_delete = "#BF616A",
	git_rename = "#88C0D0",
	git_conflict = "#EBCB8B",

	-- Blended background colors (for diff/diagnostics)
	diff_add_bg = "#252E24",
	diff_change_bg = "#332F22",
	diff_delete_bg = "#2D2123",
	diff_text_bg = "#3D3A28",
	diag_error_bg = "#2D2123",
	diag_warn_bg = "#332F22",
	diag_info_bg = "#263035",
	diag_hint_bg = "#232323",
	diag_ok_bg = "#252E24",

	-- Terminal ANSI colors
	black = "#2A2A2A",
	red = "#BF616A",
	green = "#A3BE8C",
	yellow = "#EBCB8B",
	blue = "#81A1C1",
	magenta = "#B48EAD",
	cyan = "#88C0D0",
	white = "#D8DEE9",

	-- Bright terminal colors
	bright_black = "#505050",
	bright_red = "#BF616A",
	bright_green = "#A3BE8C",
	bright_yellow = "#EBCB8B",
	bright_blue = "#81A1C1",
	bright_magenta = "#B48EAD",
	bright_cyan = "#88C0D0",
	bright_white = "#FFFFFF",
}

function M.setup(opts)
	opts = opts or {}

	-- Reset highlighting
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "anysphere"

	local c = M.colors

	-- Helper function for setting highlights
	local function hi(group, hl)
		vim.api.nvim_set_hl(0, group, hl)
	end

	-- ============================================
	-- Editor UI
	-- ============================================
	hi("Normal", { fg = c.fg, bg = c.bg })
	hi("NormalNC", { fg = c.fg, bg = c.bg })
	hi("NormalFloat", { fg = c.fg, bg = c.bg_dark })
	hi("FloatBorder", { fg = c.border_focused, bg = c.bg_dark })
	hi("FloatTitle", { fg = c.fg, bg = c.bg_dark, bold = true })
	hi("Cursor", { fg = c.bg, bg = c.cursor })
	hi("CursorLine", { bg = c.cursorline })
	hi("CursorColumn", { bg = c.cursorline })
	hi("ColorColumn", { bg = c.bg_highlight })
	hi("LineNr", { fg = c.line_nr })
	hi("CursorLineNr", { fg = c.line_nr_active, bold = true })
	hi("SignColumn", { fg = c.fg_disabled, bg = c.bg })
	hi("FoldColumn", { fg = c.fg_disabled, bg = c.bg })
	hi("Folded", { fg = c.comment, bg = c.bg_highlight })
	hi("VertSplit", { fg = c.border_variant })
	hi("WinSeparator", { fg = c.border_variant })

	-- Visual selection
	hi("Visual", { bg = c.bg_visual })
	hi("VisualNOS", { bg = c.bg_visual })

	-- Search
	hi("Search", { bg = c.bg_search })
	hi("IncSearch", { fg = c.bg, bg = c.yellow })
	hi("CurSearch", { fg = c.bg, bg = c.yellow })
	hi("Substitute", { fg = c.bg, bg = c.red })

	-- Popup menu
	hi("Pmenu", { fg = c.fg, bg = c.bg_dark })
	hi("PmenuSel", { fg = c.fg, bg = c.bg_highlight })
	hi("PmenuSbar", { bg = c.bg_dark })
	hi("PmenuThumb", { bg = c.scrollbar })

	-- Status line
	hi("StatusLine", { fg = c.fg, bg = c.bg_dark })
	hi("StatusLineNC", { fg = c.fg_disabled, bg = c.bg_dark })
	hi("WinBar", { fg = c.fg, bg = c.bg })
	hi("WinBarNC", { fg = c.fg_disabled, bg = c.bg })

	-- Tab line
	hi("TabLine", { fg = c.fg_muted, bg = c.bg_dark })
	hi("TabLineSel", { fg = c.fg, bg = c.bg })
	hi("TabLineFill", { bg = c.bg_dark })

	-- Messages
	hi("ModeMsg", { fg = c.fg })
	hi("MoreMsg", { fg = c.info })
	hi("Question", { fg = c.info })
	hi("WarningMsg", { fg = c.warning })
	hi("ErrorMsg", { fg = c.error })

	-- Special characters
	hi("NonText", { fg = c.fg_disabled })
	hi("SpecialKey", { fg = c.fg_disabled })
	hi("Whitespace", { fg = c.fg_disabled })
	hi("EndOfBuffer", { fg = c.fg_disabled })

	-- Matching
	hi("MatchParen", { fg = c.yellow, bold = true })

	-- Directory
	hi("Directory", { fg = c.blue })

	-- Diff
	hi("DiffAdd", { bg = c.diff_add_bg })
	hi("DiffChange", { bg = c.diff_change_bg })
	hi("DiffDelete", { bg = c.diff_delete_bg })
	hi("DiffText", { bg = c.diff_text_bg })

	-- Spell
	hi("SpellBad", { sp = c.error, undercurl = true })
	hi("SpellCap", { sp = c.warning, undercurl = true })
	hi("SpellLocal", { sp = c.info, undercurl = true })
	hi("SpellRare", { sp = c.hint, undercurl = true })

	-- ============================================
	-- Syntax highlighting
	-- ============================================
	hi("Comment", { fg = c.comment, italic = true })

	hi("Constant", { fg = c.constant })
	hi("String", { fg = c.string })
	hi("Character", { fg = c.string })
	hi("Number", { fg = c.number })
	hi("Float", { fg = c.number })
	hi("Boolean", { fg = c.constant })

	hi("Identifier", { fg = c.variable })
	hi("Function", { fg = c.func })

	hi("Statement", { fg = c.keyword })
	hi("Conditional", { fg = c.keyword })
	hi("Repeat", { fg = c.keyword })
	hi("Label", { fg = c.fg_dark })
	hi("Operator", { fg = c.operator })
	hi("Keyword", { fg = c.keyword })
	hi("Exception", { fg = c.keyword })

	hi("PreProc", { fg = c.preproc })
	hi("Include", { fg = c.keyword })
	hi("Define", { fg = c.preproc })
	hi("Macro", { fg = c.preproc })
	hi("PreCondit", { fg = c.preproc })

	hi("Type", { fg = c.type })
	hi("StorageClass", { fg = c.keyword })
	hi("Structure", { fg = c.type })
	hi("Typedef", { fg = c.type })

	hi("Special", { fg = c.fg_dark })
	hi("SpecialChar", { fg = c.fg_dark })
	hi("Tag", { fg = c.tag })
	hi("Delimiter", { fg = c.punctuation })
	hi("SpecialComment", { fg = c.comment, italic = true })
	hi("Debug", { fg = c.warning })

	hi("Underlined", { fg = c.link_uri, underline = true })
	hi("Ignore", { fg = c.fg_disabled })
	hi("Error", { fg = c.error })
	hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

	-- ============================================
	-- Treesitter
	-- ============================================
	hi("@comment", { link = "Comment" })
	hi("@comment.documentation", { fg = c.comment, italic = true })

	hi("@constant", { fg = c.constant })
	hi("@constant.builtin", { fg = c.constant })
	hi("@constant.macro", { fg = c.preproc })

	hi("@string", { fg = c.string })
	hi("@string.escape", { fg = c.fg_dark })
	hi("@string.regex", { fg = c.regex })
	hi("@string.special", { fg = c.string })

	hi("@character", { fg = c.string })
	hi("@character.special", { fg = c.fg_dark })

	hi("@number", { fg = c.number })
	hi("@number.float", { fg = c.number })
	hi("@boolean", { fg = c.constant })

	hi("@function", { fg = c.func })
	hi("@function.builtin", { fg = c.func })
	hi("@function.call", { fg = c.func })
	hi("@function.macro", { fg = c.preproc })
	hi("@function.method", { fg = c.func })
	hi("@function.method.call", { fg = c.func })

	hi("@constructor", { fg = c.constructor })

	hi("@variable", { fg = c.variable })
	hi("@variable.builtin", { fg = c.variable_special, italic = true })
	hi("@variable.parameter", { fg = c.variable_param, italic = true })
	hi("@variable.member", { fg = c.variable })

	hi("@property", { fg = c.property })

	hi("@type", { fg = c.type })
	hi("@type.builtin", { fg = c.type_builtin })
	hi("@type.definition", { fg = c.type })
	hi("@type.qualifier", { fg = c.keyword })

	hi("@attribute", { fg = c.attribute, italic = true })
	hi("@attribute.builtin", { fg = c.attribute, italic = true })

	hi("@keyword", { fg = c.keyword })
	hi("@keyword.conditional", { fg = c.keyword })
	hi("@keyword.coroutine", { fg = c.keyword })
	hi("@keyword.debug", { fg = c.keyword })
	hi("@keyword.directive", { fg = c.preproc })
	hi("@keyword.exception", { fg = c.keyword })
	hi("@keyword.function", { fg = c.keyword })
	hi("@keyword.import", { fg = c.keyword })
	hi("@keyword.modifier", { fg = c.keyword })
	hi("@keyword.operator", { fg = c.operator })
	hi("@keyword.repeat", { fg = c.keyword })
	hi("@keyword.return", { fg = c.keyword })
	hi("@keyword.storage", { fg = c.keyword })
	hi("@keyword.type", { fg = c.keyword })

	hi("@operator", { fg = c.operator })

	hi("@punctuation.bracket", { fg = c.punctuation_bracket })
	hi("@punctuation.delimiter", { fg = c.punctuation })
	hi("@punctuation.special", { fg = c.punctuation })

	hi("@tag", { fg = c.tag })
	hi("@tag.attribute", { fg = c.attribute, italic = true })
	hi("@tag.delimiter", { fg = c.punctuation })
	hi("@tag.builtin", { fg = c.tag })

	hi("@label", { fg = c.fg_dark })

	hi("@markup.heading", { fg = c.fg_dark, bold = true })
	hi("@markup.italic", { fg = c.emphasis, italic = true })
	hi("@markup.strong", { fg = c.emphasis_strong, bold = true })
	hi("@markup.strikethrough", { strikethrough = true })
	hi("@markup.underline", { underline = true })
	hi("@markup.quote", { fg = c.comment, italic = true })
	hi("@markup.math", { fg = c.number })
	hi("@markup.link", { fg = c.link_text })
	hi("@markup.link.label", { fg = c.link_text })
	hi("@markup.link.url", { fg = c.link_uri, underline = true })
	hi("@markup.raw", { fg = c.string })
	hi("@markup.list", { fg = c.punctuation })

	hi("@diff.plus", { fg = c.git_add })
	hi("@diff.minus", { fg = c.git_delete })
	hi("@diff.delta", { fg = c.git_change })

	-- ============================================
	-- LSP semantic tokens
	-- ============================================
	hi("@lsp.type.class", { fg = c.type })
	hi("@lsp.type.comment", { link = "Comment" })
	hi("@lsp.type.decorator", { fg = c.attribute, italic = true })
	hi("@lsp.type.enum", { fg = c.constructor })
	hi("@lsp.type.enumMember", { fg = c.constant })
	hi("@lsp.type.function", { fg = c.func })
	hi("@lsp.type.interface", { fg = c.type, italic = true })
	hi("@lsp.type.keyword", { fg = c.keyword })
	hi("@lsp.type.macro", { fg = c.preproc })
	hi("@lsp.type.method", { fg = c.func })
	hi("@lsp.type.namespace", { fg = c.variable })
	hi("@lsp.type.number", { fg = c.number })
	hi("@lsp.type.operator", { fg = c.operator })
	hi("@lsp.type.parameter", { fg = c.variable_param, italic = true })
	hi("@lsp.type.property", { fg = c.property })
	hi("@lsp.type.string", { fg = c.string })
	hi("@lsp.type.struct", { fg = c.type })
	hi("@lsp.type.type", { fg = c.type })
	hi("@lsp.type.typeParameter", { fg = c.type, italic = true })
	hi("@lsp.type.variable", { fg = c.variable })

	hi("@lsp.mod.declaration", {})
	hi("@lsp.mod.definition", {})
	hi("@lsp.mod.readonly", {})
	hi("@lsp.mod.static", {})
	hi("@lsp.mod.deprecated", { strikethrough = true })
	hi("@lsp.mod.abstract", { italic = true })
	hi("@lsp.mod.async", {})
	hi("@lsp.mod.modification", {})
	hi("@lsp.mod.documentation", {})
	hi("@lsp.mod.defaultLibrary", {})

	-- ============================================
	-- Diagnostics
	-- ============================================
	hi("DiagnosticError", { fg = c.error })
	hi("DiagnosticWarn", { fg = c.warning })
	hi("DiagnosticInfo", { fg = c.info })
	hi("DiagnosticHint", { fg = c.hint })
	hi("DiagnosticOk", { fg = c.success })

	hi("DiagnosticVirtualTextError", { fg = c.error, bg = c.diag_error_bg })
	hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = c.diag_warn_bg })
	hi("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.diag_info_bg })
	hi("DiagnosticVirtualTextHint", { fg = c.hint, bg = c.diag_hint_bg })
	hi("DiagnosticVirtualTextOk", { fg = c.success, bg = c.diag_ok_bg })

	hi("DiagnosticUnderlineError", { sp = c.error, undercurl = true })
	hi("DiagnosticUnderlineWarn", { sp = c.warning, undercurl = true })
	hi("DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
	hi("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
	hi("DiagnosticUnderlineOk", { sp = c.success, undercurl = true })

	hi("DiagnosticSignError", { fg = c.error })
	hi("DiagnosticSignWarn", { fg = c.warning })
	hi("DiagnosticSignInfo", { fg = c.info })
	hi("DiagnosticSignHint", { fg = c.hint })
	hi("DiagnosticSignOk", { fg = c.success })

	-- ============================================
	-- Git signs
	-- ============================================
	hi("GitSignsAdd", { fg = c.git_add })
	hi("GitSignsChange", { fg = c.git_change })
	hi("GitSignsDelete", { fg = c.git_delete })
	hi("GitSignsAddNr", { fg = c.git_add })
	hi("GitSignsChangeNr", { fg = c.git_change })
	hi("GitSignsDeleteNr", { fg = c.git_delete })
	hi("GitSignsAddLn", { bg = c.diff_add_bg })
	hi("GitSignsChangeLn", { bg = c.diff_change_bg })
	hi("GitSignsDeleteLn", { bg = c.diff_delete_bg })

	-- ============================================
	-- Telescope
	-- ============================================
	hi("TelescopeNormal", { fg = c.fg, bg = c.bg_dark })
	hi("TelescopeBorder", { fg = c.border_focused, bg = c.bg_dark })
	hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_highlight })
	hi("TelescopePromptBorder", { fg = c.border_focused, bg = c.bg_highlight })
	hi("TelescopePromptTitle", { fg = c.bg, bg = c.cyan })
	hi("TelescopePreviewTitle", { fg = c.bg, bg = c.green })
	hi("TelescopeResultsTitle", { fg = c.bg, bg = c.blue })
	hi("TelescopeSelection", { bg = c.bg_highlight })
	hi("TelescopeSelectionCaret", { fg = c.cyan })
	hi("TelescopeMatching", { fg = c.yellow, bold = true })

	-- ============================================
	-- Nvim-tree
	-- ============================================
	hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
	hi("NvimTreeNormalNC", { fg = c.fg, bg = c.bg_dark })
	hi("NvimTreeRootFolder", { fg = c.blue, bold = true })
	hi("NvimTreeFolderName", { fg = c.blue })
	hi("NvimTreeFolderIcon", { fg = c.blue })
	hi("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
	hi("NvimTreeEmptyFolderName", { fg = c.fg_disabled })
	hi("NvimTreeSymlink", { fg = c.cyan })
	hi("NvimTreeSpecialFile", { fg = c.yellow })
	hi("NvimTreeGitDirty", { fg = c.git_change })
	hi("NvimTreeGitNew", { fg = c.git_add })
	hi("NvimTreeGitDeleted", { fg = c.git_delete })
	hi("NvimTreeGitRenamed", { fg = c.git_rename })
	hi("NvimTreeIndentMarker", { fg = c.border_variant })

	-- ============================================
	-- Neo-tree
	-- ============================================
	hi("NeoTreeNormal", { fg = c.fg, bg = c.bg_dark })
	hi("NeoTreeNormalNC", { fg = c.fg, bg = c.bg_dark })
	hi("NeoTreeDirectoryName", { fg = c.blue })
	hi("NeoTreeDirectoryIcon", { fg = c.blue })
	hi("NeoTreeRootName", { fg = c.blue, bold = true })
	hi("NeoTreeFileName", { fg = c.fg })
	hi("NeoTreeFileIcon", { fg = c.fg })
	hi("NeoTreeSymbolicLinkTarget", { fg = c.cyan })
	hi("NeoTreeGitAdded", { fg = c.git_add })
	hi("NeoTreeGitConflict", { fg = c.git_conflict })
	hi("NeoTreeGitDeleted", { fg = c.git_delete })
	hi("NeoTreeGitModified", { fg = c.git_change })
	hi("NeoTreeGitUntracked", { fg = c.git_add })
	hi("NeoTreeIndentMarker", { fg = c.border_variant })

	-- ============================================
	-- Which-key
	-- ============================================
	hi("WhichKey", { fg = c.cyan })
	hi("WhichKeyGroup", { fg = c.blue })
	hi("WhichKeyDesc", { fg = c.fg })
	hi("WhichKeySeperator", { fg = c.comment })
	hi("WhichKeySeparator", { fg = c.comment })
	hi("WhichKeyFloat", { bg = c.bg_dark })
	hi("WhichKeyValue", { fg = c.fg_muted })

	-- ============================================
	-- Indent blankline
	-- ============================================
	hi("IndentBlanklineChar", { fg = c.border_variant })
	hi("IndentBlanklineContextChar", { fg = c.border_focused })
	hi("IblIndent", { fg = c.border_variant })
	hi("IblScope", { fg = c.border_focused })

	-- ============================================
	-- Nvim-cmp
	-- ============================================
	hi("CmpItemAbbr", { fg = c.fg })
	hi("CmpItemAbbrDeprecated", { fg = c.fg_disabled, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = c.cyan, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = c.cyan, bold = true })
	hi("CmpItemKind", { fg = c.fg_muted })
	hi("CmpItemMenu", { fg = c.fg_muted })

	hi("CmpItemKindClass", { fg = c.type })
	hi("CmpItemKindColor", { fg = c.string })
	hi("CmpItemKindConstant", { fg = c.constant })
	hi("CmpItemKindConstructor", { fg = c.constructor })
	hi("CmpItemKindEnum", { fg = c.constructor })
	hi("CmpItemKindEnumMember", { fg = c.constant })
	hi("CmpItemKindEvent", { fg = c.yellow })
	hi("CmpItemKindField", { fg = c.property })
	hi("CmpItemKindFile", { fg = c.fg })
	hi("CmpItemKindFolder", { fg = c.blue })
	hi("CmpItemKindFunction", { fg = c.func })
	hi("CmpItemKindInterface", { fg = c.type })
	hi("CmpItemKindKeyword", { fg = c.keyword })
	hi("CmpItemKindMethod", { fg = c.func })
	hi("CmpItemKindModule", { fg = c.blue })
	hi("CmpItemKindOperator", { fg = c.operator })
	hi("CmpItemKindProperty", { fg = c.property })
	hi("CmpItemKindReference", { fg = c.variable })
	hi("CmpItemKindSnippet", { fg = c.yellow })
	hi("CmpItemKindStruct", { fg = c.type })
	hi("CmpItemKindText", { fg = c.fg })
	hi("CmpItemKindTypeParameter", { fg = c.type })
	hi("CmpItemKindUnit", { fg = c.number })
	hi("CmpItemKindValue", { fg = c.number })
	hi("CmpItemKindVariable", { fg = c.variable })

	-- ============================================
	-- Lazy.nvim
	-- ============================================
	hi("LazyH1", { fg = c.bg, bg = c.cyan, bold = true })
	hi("LazyButton", { fg = c.fg, bg = c.bg_highlight })
	hi("LazyButtonActive", { fg = c.bg, bg = c.blue })
	hi("LazySpecial", { fg = c.cyan })

	-- ============================================
	-- Mason
	-- ============================================
	hi("MasonHeader", { fg = c.bg, bg = c.cyan, bold = true })
	hi("MasonHighlight", { fg = c.cyan })
	hi("MasonHighlightBlock", { fg = c.bg, bg = c.cyan })
	hi("MasonHighlightBlockBold", { fg = c.bg, bg = c.cyan, bold = true })
	hi("MasonMuted", { fg = c.fg_muted })
	hi("MasonMutedBlock", { fg = c.fg, bg = c.bg_highlight })

	-- ============================================
	-- Noice
	-- ============================================
	hi("NoiceCmdline", { fg = c.fg })
	hi("NoiceCmdlineIcon", { fg = c.cyan })
	hi("NoiceCmdlinePopup", { fg = c.fg, bg = c.bg_dark })
	hi("NoiceCmdlinePopupBorder", { fg = c.border_focused })
	hi("NoiceConfirm", { fg = c.fg, bg = c.bg_dark })
	hi("NoiceConfirmBorder", { fg = c.border_focused })

	-- ============================================
	-- Notify
	-- ============================================
	hi("NotifyERRORBorder", { fg = c.error })
	hi("NotifyWARNBorder", { fg = c.warning })
	hi("NotifyINFOBorder", { fg = c.info })
	hi("NotifyDEBUGBorder", { fg = c.fg_muted })
	hi("NotifyTRACEBorder", { fg = c.magenta })
	hi("NotifyERRORIcon", { fg = c.error })
	hi("NotifyWARNIcon", { fg = c.warning })
	hi("NotifyINFOIcon", { fg = c.info })
	hi("NotifyDEBUGIcon", { fg = c.fg_muted })
	hi("NotifyTRACEIcon", { fg = c.magenta })
	hi("NotifyERRORTitle", { fg = c.error })
	hi("NotifyWARNTitle", { fg = c.warning })
	hi("NotifyINFOTitle", { fg = c.info })
	hi("NotifyDEBUGTitle", { fg = c.fg_muted })
	hi("NotifyTRACETitle", { fg = c.magenta })

	-- ============================================
	-- Bufferline
	-- ============================================
	hi("BufferLineFill", { bg = c.bg_dark })
	hi("BufferLineBackground", { fg = c.fg_muted, bg = c.bg_dark })
	hi("BufferLineBuffer", { fg = c.fg_muted, bg = c.bg_dark })
	hi("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
	hi("BufferLineBufferVisible", { fg = c.fg_muted, bg = c.bg_dark })
	hi("BufferLineCloseButton", { fg = c.fg_muted, bg = c.bg_dark })
	hi("BufferLineCloseButtonSelected", { fg = c.fg, bg = c.bg })
	hi("BufferLineCloseButtonVisible", { fg = c.fg_muted, bg = c.bg_dark })
	hi("BufferLineSeparator", { fg = c.bg_dark, bg = c.bg_dark })
	hi("BufferLineSeparatorSelected", { fg = c.bg_dark, bg = c.bg })
	hi("BufferLineSeparatorVisible", { fg = c.bg_dark, bg = c.bg_dark })
	hi("BufferLineIndicatorSelected", { fg = c.cyan, bg = c.bg })
	hi("BufferLineModified", { fg = c.git_change, bg = c.bg_dark })
	hi("BufferLineModifiedSelected", { fg = c.git_change, bg = c.bg })
	hi("BufferLineModifiedVisible", { fg = c.git_change, bg = c.bg_dark })

	-- ============================================
	-- Lualine
	-- ============================================
	hi("LualineNormal", { fg = c.fg, bg = c.bg_dark })

	-- ============================================
	-- Terminal colors
	-- ============================================
	vim.g.terminal_color_0 = c.black
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.yellow
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = c.magenta
	vim.g.terminal_color_6 = c.cyan
	vim.g.terminal_color_7 = c.white
	vim.g.terminal_color_8 = c.bright_black
	vim.g.terminal_color_9 = c.bright_red
	vim.g.terminal_color_10 = c.bright_green
	vim.g.terminal_color_11 = c.bright_yellow
	vim.g.terminal_color_12 = c.bright_blue
	vim.g.terminal_color_13 = c.bright_magenta
	vim.g.terminal_color_14 = c.bright_cyan
	vim.g.terminal_color_15 = c.bright_white
end

return M
