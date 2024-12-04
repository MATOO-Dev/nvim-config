return {
	{
		"nvim-ufo",
		after = function()
			require("ufo").setup {
				provider_selector = function()
					return {'treesitter', 'indent'}
				end,
			}
		end,
	},
	{
		"indent-blankline.nvim",
		after = function ()
			require("ibl").setup {
			}
		end
	},
}
