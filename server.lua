VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

function isAllowedToChange(player)
    local allowed = false
    local _source = player
    local User = VorpCore.getUser(_source).getUsedCharacter
    local group = User.group
    if group == 'admin' then
        allowed = true  
    else
        allowed = false
    end
    return allowed
end



RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	TriggerClientEvent("Arkios:StartZoneLocker", charid)
end)
