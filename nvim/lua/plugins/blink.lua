local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
  keymap = { preset = "enter" },
  appearance = { nerd_font_variant = "mono" },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
})
