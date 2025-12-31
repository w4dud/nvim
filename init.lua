require 'core.lazy'
require 'core.opts'
require 'core.sign'
require 'core.lsp'
require 'core.cmds'
require 'core.maps'
require 'core.hls'

-- Enable global statusline
vim.o.laststatus = 3 -- HACK: Remove that, and fix not getting it without this line!
