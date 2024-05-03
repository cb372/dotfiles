return {
  'phaazon/hop.nvim',
  config = function()
    local hop = require('hop')

    hop.setup()

    local map = vim.keymap.set

    -- the usual f and t to jump to a given char on the same line
    -- (f jumps to the char, t jumps to just before it)
    local directions = require('hop.hint').HintDirection
    map('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, {remap=true})
    map('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {remap=true})
    map('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, {remap=true})
    map('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, {remap=true})

    -- hop to all matches of a pattern
    map('', '<leader>h', function()
      hop.hint_patterns()
    end, {remap=true})
  end
}
