-- Плагин Harpoon
return {
  "ThePrimeagen/harpoon",
  branch = "master",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Библиотека для работы Harpoon
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })

    local keymap = vim.keymap.set
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Основные бинды
    keymap("n", "<leader>ha", mark.add_file) -- Добавить файл
    keymap("n", "<leader>hh", ui.toggle_quick_menu) -- Открыть меню

    -- Harpoon
    keymap("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
    keymap("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
    keymap("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
    keymap("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
    keymap("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
    keymap("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
    keymap("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
    keymap("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
    keymap("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)


    -- Навигация по файлам (цикл вместо дублирования)
    for i = 1, 9 do
      keymap("n", "<leader>h" .. i, function()
        ui.nav_file(i)
      end)
    end

    -- Дополнительные бинды
    keymap("n", "<leader>hr", mark.rm_file) -- Удалить файл
    keymap("n", "<leader>hn", ui.nav_next) -- Следующий файл
    keymap("n", "<leader>hp", ui.nav_prev) -- Предыдущий файл

    -- Интеграция с Telescope (если используешь)
    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("harpoon")
      keymap("n", "<leader>ht", ":Telescope harpoon marks<CR>", { silent = true })
    end
  end,
}
