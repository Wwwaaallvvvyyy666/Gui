local Triplesixxx = loadstring(game:HttpGet("https://pastefy.app/j3txr34B/raw"))()

local Window = Triplesixxx:Window({
    Title   = "Triplesixxx | Example",
    Footer  = "Example",
    Image   = "136505615779937",
    Color   = Color3.fromRGB(255, 0, 0), 
    Theme   = 9542022979,
    Version = 1,
})

if Window then
    triplesixxx("Window loaded!")
end

local Tabs = {
    Info = Window:AddTab({ Name = "Info", Icon = "player" }),
    Main = Window:AddTab({ Name = "Main", Icon = "user" }),
}

X1 = Tabs.Info:AddSection("Triplesixxx | Section")

--- [[ Paragraphh ]]
X1:AddParagraph({
    Title = "Triplesixxx | Community",
    Content = "Triplesixxx Triplesixxx Triplesixxx Triplesixxx",
    Icon = "star",
})

X1:AddParagraph({
    Title = "Join Our Discord",
    Content = "Join Us!",
    Icon = "discord",
    ButtonText = "Copy Discord Link",
    ButtonCallback = function()
        local link = "https://discord.gg/triplesixxx"
        if setclipboard then
            setclipboard(link)
            triplesixxx("Successfully Copied!")
        end
    end
})

X1:AddDivider()

X1:AddSubSection("TRIPLESIXXX 666 TRIPLESIXXX")

PanelSection = Tabs.Main:AddSection("Triplesixxx | Panel")

PanelSection:AddPanel({
    Title = "Triplesixxx | Discord",
    --  Content = "Sub Title", --- can use sub title here.
    ButtonText = "Copy Discord Link",
    ButtonCallback = function()
        if setclipboard then
            setclipboard("https://discord.gg/triplesixxx")
            triplesixxx("Link Discord telah disalin ke clipboard.")
        else
            triplesixxx("Executor tidak mendukung setclipboard.")
        end
    end,
    SubButtonText = "Open Discord",
    SubButtonCallback = function()
        triplesixxx("Membuka link Discord...")
        task.spawn(function()
            game:GetService("GuiService"):OpenBrowserWindow("https://discord.gg/s7uUrM5gjq")
        end)
    end
})

PanelSection:AddPanel({
    Title = "Triplesixxx | Utility",
    Placeholder = "https://discord.com/api/webhooks/...",
    ButtonText = "Rejoin Server",
    ButtonCallback = function()
        triplesixxx("Rejoining server...")
        task.wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

PanelSection:AddPanel({
    Title = "Triplesixxx | Webhook",
    Placeholder = "https://discord.com/api/webhooks/...",
    ButtonText = "Simpan Webhook",
    ButtonCallback = function(url)
        if url == "" then
            triplesixxx("Mohon isi URL webhook terlebih dahulu.")
            return
        end
        _G.TriplesixxxWebhook = url
        ConfigData.WebhookURL = url
        SaveConfig()
        triplesixxx("Webhook telah disimpan.")
    end,
    SubButtonText = "Test Webhook",
    SubButtonCallback = function()
        if not _G.TriplesixxxWebhook or _G.TriplesixxxWebhook == "" then
            triplesixxx("Webhook belum diset.")
            return
        end
        triplesixxx("Mengirim test webhook...")
        task.spawn(function()
            local HttpService = game:GetService("HttpService")
            local data = { content = "Test webhook dari Triplesixxx." }
            pcall(function()
                HttpService:PostAsync(_G.TriplesixxxWebhook, HttpService:JSONEncode(data))
            end)
        end)
    end
})

local BtnSection = Tabs.Main:AddSection("Triplesixxx | Button")

BtnSection:AddButton({
    Title = "Open Discord",
    Callback = function()
        triplesixxx("Membuka Discord...")
        task.spawn(function()
            game:GetService("GuiService"):OpenBrowserWindow("https://discord.gg/triplesixxx")
        end)
    end
})

BtnSection:AddButton({
    Title = "Rejoin",
    SubTitle = "Server Hop",
    Callback = function()
        triplesixxx("Rejoining server...")
        task.wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end,
    SubCallback = function()
        triplesixxx("Mencari server baru...")
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Servers = Http:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" ..
            game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, v in pairs(Servers.data) do
            if v.playing < v.maxPlayers then
                TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                return
            end
        end
        triplesixxx("Tidak ada server kosong ditemukan.")
    end
})

local ToggleSection = Tabs.Main:AddSection("Triplesixxx | Toggle")

ToggleSection:AddToggle({
    Title = "Auto Fishing",
    Content = "Aktifkan auto fishing menggunakan Triplesixxx System.",
    Default = false,
    Callback = function(state)
        if state then
            triplesixxx("Auto Fishing diaktifkan.")
            _G.AutoFish = true
        else
            triplesixxx("Auto Fishing dimatikan.")
            _G.AutoFish = false
        end
    end
})

ToggleSection:AddToggle({
    Title = "Auto Sell",
    Title2 = "Sell All Fish Automatically",
    Content = "Menjual semua ikan setelah menangkapnya.",
    Default = false,
    Callback = function(state)
        if state then
            triplesixxx("Auto Sell aktif.")
            _G.AutoSell = true
        else
            triplesixxx("Auto Sell nonaktif.")
            _G.AutoSell = false
        end
    end
})

local SliderSection = Tabs.Main:AddSection("Triplesixxx | Slider")

SliderSection:AddSlider({
    Title = "Fishing Delay",
    Content = "Atur jeda waktu auto fishing.",
    Min = 0.1,
    Max = 5,
    Increment = 0.1,
    Default = 1,
    Callback = function(value)
        _G.Delay = value
        triplesixxx("Delay diset ke: " .. tostring(value) .. " detik.")
    end
})

SliderSection:AddSlider({
    Title = "Sound Volume",
    Content = "Sesuaikan volume efek suara Triplesixxx.",
    Min = 0,
    Max = 100,
    Increment = 5,
    Default = 50,
    Callback = function(value)
        triplesixxx("Volume diubah ke: " .. tostring(value) .. "%")
    end
})

SliderSection:AddSlider({
    Title = "Animation Speed",
    Content = "Atur kecepatan animasi antarmuka Triplesixxx.",
    Min = 0.5,
    Max = 2,
    Increment = 0.1,
    Default = 1,
    Callback = function(value)
        _G.AnimationSpeed = value
        triplesixxx("Kecepatan animasi diset ke: " .. tostring(value) .. "x")
    end
})

local InputSection = Tabs.Main:AddSection("Triplesixxx | Input")

InputSection:AddInput({
    Title = "Username",
    Content = "Masukkan nama pengguna kamu untuk disimpan di konfigurasi.",
    Default = "",
    Callback = function(value)
        _G.TriplesixxxUsername = value
        triplesixxx("Username diset ke: " .. value)
    end
})

local DropdownSection = Tabs.Main:AddSection("Triplesixxx | Dropdown")

DropdownSection:AddDropdown({
    Title = "Select Theme",
    Content = "Pilih tema antarmuka untuk Triplesixxx.",
    Options = { "Walvy Community", "Walvy", "Triplesixxx", "Ak.A Triplesixxx" },
    Default = "Celestial",
    Callback = function(value)
        _G.SelectedTheme = value
        triplesixxx("Tema diubah ke: " .. value)
    end
})

DropdownSection:AddDropdown({
    Title = "Select Features",
    Content = "Pilih beberapa fitur Triplesixxx yang ingin diaktifkan.",
    Multi = true,
    Options = { "Auto Fishing", "Auto Sell", "Auto Quest", "Webhook Notification" },
    Default = { "Auto Fishing" },
    Callback = function(selected)
        _G.ActiveFeatures = selected
        triplesixxx("Fitur aktif: " .. table.concat(selected, ", "))
    end
})

local DynamicDropdown = DropdownSection:AddDropdown({
    Title = "Select Bait",
    Content = "Pilih umpan yang akan digunakan.",
    Options = {},
    Default = nil,
    Callback = function(value)
        _G.SelectedBait = value
        triplesixxx("Umpan dipilih: " .. value)
    end
})

task.spawn(function()
    task.wait(1)
    local baitList = { "Common Bait", "Rare Bait", "Mythic Bait", "Divine Bait" }
    DynamicDropdown:SetValues(baitList, "Common Bait")
end)
