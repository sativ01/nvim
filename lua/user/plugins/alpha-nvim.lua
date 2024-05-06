local	dgcat = {
    [[]],
    [[]],
		[[                       ░░░ ░░░                    ]],
		[[                      ░▒█░░▒█░                    ]],
		[[                     ░▒▓█░░░░░░                   ]],
		[[                     ░▒░░▓▓██▓▓░                  ]],
		[[                     ░▒▒▓▓▓▓██▓▓░                 ]],
		[[                    ░░▒▓▓▓░▓▓▓░▓░                 ]],
		[[                   ░▓░▒▒▓▓░▓▓▓░▓░                 ]],
		[[                  ░▒░░▒▓▓▓▓██░█▓░                 ]],
		[[                  ░▓░░▒▒▓▓▓████▓░                 ]],
		[[                   ░▒░░▒▒▒▒▒▒▒▒░                  ]],
		[[──╖                ░▓░░░░░░░░░░                ╓──]],
		[[□ ║──╖              ░▓▓▓▓▓███░              ╓──║ □]],
		[[◫ ║□ ║              ░▓▓▓▓▓███░              ║ □║ ◫]],
		[[□ ║◫ ║──╖           ░▒▓▓▒▒▓█▓░           ╓──║ □║ ◫]],
		[[◫ ║◫ ║□ ║           ░▒▒░░▒▒░▒░           ║ ◫║ ◫║ □]],
    [[]],
    [[]],
	}

  return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = dgcat,
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            keymap = 'SPC f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = function() require('fzf-lua').files() end,
          },
          {
            icon = ' ',
            desc = 'Recent files',
            key = 'r',
            keymap = 'SPC s r',
            action = function() require('fzf-lua').oldfiles() end,
            key_format = ' %s', -- remove default surrounding `[]`
          },
        },
        footer = {}  --your footer
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
};
