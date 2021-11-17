
local isUiOpen = false
local editingNotpadId = nil

-- Functions

local function openGui()
    local veh = GetVehiclePedIsUsing(PlayerPedId())
    if GetPedInVehicleSeat(veh, -1) ~= PlayerPedId() then
        SetPlayerControl(PlayerId(), 0, 0)
        SendNUIMessage({
            action = 'openNotepad',
        })
        isUiOpen = true
        SetNuiFocus(true, true);
    end
end

-- Events

RegisterNetEvent('qb-notepad:client:OpenNotepadGui', function()
    if not isUiOpen then
        openGui()
    end
end)

RegisterNetEvent('qb-notepad:client:CloseNotepad', function()
    SendNUIMessage({
        action = 'closeNotepad'
    })
    SetPlayerControl(PlayerId(), 1, 0)
    isUiOpen = false
    SetNuiFocus(false, false);
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    Wait(100)
end)

RegisterNetEvent('qb-notepad:client:note', function()
    local player = PlayerPedId()
    
    if (DoesEntityExist(player) and not IsEntityDead(player)) then
        TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
    end
end)

RegisterNetEvent('qb-notepad:client:updateNotes', function(serverNotesPassed)
    TestLocalTable = serverNotesPassed
end)

-- Callbacks

RegisterNUICallback('escape', function(data, cb)
    local text = data.text
    TriggerEvent('qb-notepad:client:CloseNotepad')
end)

RegisterNUICallback('updating', function(data, cb)
    local text = data.text
    TriggerServerEvent('qb-notepad:server:updateNote', editingNotpadId, text)
    editingNotpadId = nil
    TriggerEvent('qb-notepad:client:CloseNotepad')
end)