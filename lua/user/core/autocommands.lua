if os.getenv("TMUX") then
  local group = vim.api.nvim_create_augroup("tmux_something", { clear = true })

  -- Turn off tmux status when entering/resuming Neovim
  vim.api.nvim_create_autocmd({"VimEnter", "VimResume"}, {
    group = group,
    callback = function()
      os.execute("tmux set status off")
    end,
  })

  -- Turn on tmux status when leaving/suspending Neovim
  vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
    group = group,
    callback = function()
      os.execute("tmux set status on")
    end,
  })
end
