return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cond = function()
		return vim.g.vscode == nil
	end,

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                                           ]],
			[[                                                                                           ]],
			[[                                  ▒                     ▒▒▒▒▒     ▒▒▒                      ]],
			[[                     ▒   ▒  ▒   ▒                     ▒▒ ▒▒ ▒▒  ▒▒  ▒▒                     ]],
			[[                        ▒         ▒▒                      ▒▒▒ ▒▒  ▒▒▒ ▒▒▒▒▒                ]],
			[[           ▒▒    ▒▒                                         ▒▒▒     ▒▒ ▒▒                  ]],
			[[          ▒▒    ▒▒     ▒▒▒▒▒▒▒▒▒▒                  ▒▒▒▒▒▒                                  ]],
			[[                      ▒▒▒▒▒ ▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒                   ▒    ▒▒▒▒   ▒           ]],
			[[          ▒   ▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒        ]],
			[[    ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒ ▒▒▒▒▒▒         ▒▒▒▒▒▒  ▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ▒▒▒       ]],
			[[    ▒▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒ ▒▒▒▒▒▒   ▒▒▒       ]],
			[[    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒ ▒▒▒▒▒▒   ▒▒▒▒      ]],
			[[     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                  ▒▒▒▒▒▒▒▒▒     ▒▒▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒▒      ]],
			[[     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                                ▒▒▒▒▒▒ ▒▒▒▒▒  ▒▒               ▒ ▒▒▒   ]],
			[[     ▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒                ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒                                 ]],
			[[     ▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒  ▒▒ ▒▒ ▒ ▒▒▒▒  ▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒▒▒    ▒          ▒▒ ▒▒   ▒▒ ▒▒     ]],
			[[     ▒▒▒▒▒▒  ▒▒▒▒▒▒▒                  ▒▒▒▒▒ ▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒▒▒    ▒▒      ▒▒  ▒▒▒  ▒     ]],
			[[                                       ▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒    ▒▒▒▒▒▒  ▒▒                     ]],
			[[            ▒ ▒▒▒ ▒▒ ▒▒▒ ▒▒ ▒▒▒        ▒▒▒▒▒▒▒▒▒            ▒▒  ▒▒▒ ▒▒                     ]],
			[[              ▒▒▒    ▒▒▒     ▒          ▒▒▒▒▒▒▒▒            ▒▒▒   ▒▒▒▒                     ]],
			[[                                                             ▒▒    ▒▒                      ]],
			[[                                                                                           ]],
		}

		_Gopts = {
			position = "center",

			hl = "Type",
			-- wrap = "overflow";
		}

		local function footer()
			return "Do what you can't!"
		end


		dashboard.section.footer.val = footer()

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
