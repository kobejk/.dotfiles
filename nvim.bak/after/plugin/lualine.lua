-- setup lualine

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto' -- automatically set theme to what is being used in ColorMyPencils()
    },
    sections = { -- show full path to file in lualine 
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
