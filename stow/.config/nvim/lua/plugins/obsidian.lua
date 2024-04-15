return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	opts = {
		disable_frontmatter = true,
		workspaces = {
			{
				name = "acast",
				path = "~/My Drive/obsidian-vaults/acast",
			},
			{
				name = "private",
				path = "~/My Drive/obsidian-vaults/private",
			}
		}
	}
}
