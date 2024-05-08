--[[ Color Schemes ]]

function ColorMyPencils(color)
	color = color or "codedark"
	vim.cmd('colorscheme ' .. color)
end

ColorMyPencils()

