-- Загрузочный скрипт для основного скрипта

-- URL основного скрипта
local scriptURL = "https://raw.githubusercontent.com/Veiz0926/DandysWorldScript/main/main_script.lua"

-- Функция для загрузки и выполнения основного скрипта
local function loadMainScript()
    local response = game:HttpGet(scriptURL, true)
    if response then
        loadstring(response)()
    else
        warn("Не удалось загрузить основной скрипт.")
    end
end

-- Запуск функции загрузки основного скрипта
loadMainScript()
