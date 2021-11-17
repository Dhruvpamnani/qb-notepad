local QBCore = exports['qb-core']:GetCoreObject()
local savedNotes = {}

TriggerEvent('qb-notepad:server:LoadsNote')

QBCore.Functions.CreateUseableItem('notepad', function(source)
    local src = source
    TriggerClientEvent('qb-notepad:client:note', src)
    TriggerClientEvent('qb-notepad:client:OpenNotepadGui', src)
end)

RegisterNetEvent('qb-notepad:server:LoadsNote', function()
    TriggerClientEvent('qb-notepad:client:updateNotes', -1, savedNotes)
end)

RegisterNetEvent('qb-notepad:server:newNote', function(text, x, y, z)
    local import = {['text'] = '' .. text .. '', ['x'] = x, ['y'] = y, ['z'] = z}
    table.insert(savedNotes, import)
    TriggerEvent('qb-notepad:server:LoadsNote')
end)

RegisterNetEvent('qb-notepad:server:updateNote', function(noteID, text)
    savedNotes[noteID]['text'] = text
    TriggerEvent('qb-notepad:server:LoadsNote')
end)