return {
	"sphamba/smear-cursor.nvim",
	opts = {
		-- Match Macterm's native white cursor and avoid a color gradient while moving.
		cursor_color = "#ffffff",
		cursor_color_insert_mode = "#ffffff",
		color_levels = 1,

		-- Keep the cursor rectangular and smooth, without a visible trail.
		stiffness = 0.75,
		trailing_stiffness = 0.75,
		matrix_pixel_threshold = 0.7,

		-- Use the same smooth motion for the vertical caret in Insert mode.
		stiffness_insert_mode = 0.75,
		trailing_stiffness_insert_mode = 0.75,
	},
}
