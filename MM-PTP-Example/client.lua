------------------------------------------------------------------------------------------------
------Friendy fire script - it will block kills from all elements(i.e. Weapons and vehicle)-----
                          -----to the team President and Police-----
------------------------------------------------------------------------------------------------
function stopvehandwepDamage(at)
        if getElementType(at)=="player" then
                local atTeam = getTeamName(getPlayerTeam(at))
                local dtTeam = getTeamName(getPlayerTeam(source))
                if atTeam=="President" and (dtTeam=="Police")
                then
                        cancelEvent()
                elseif atTeam=="Police" and (dtTeam=="President") then
                        cancelEvent()
        elseif getElementType(at)=="vehicle" then
                local gvc  = getVehicleController(at)
                if getElementType(gvc) ~= "player" then return
                 end
                local atTeam = getTeamName(getPlayerTeam(gvc))
                local dtTeam = getTeamName(getPlayerTeam(source))
                if atTeam=="President" and (dtTeam=="Police") then
                        cancelEvent()
                elseif atTeam=="Police" and (dtTeam=="President") then
                        cancelEvent()
                end
        end
end
addEventHandler("onClientPlayerDamage", localPlayer, stopvehandwepDamage)
 
--------------block knife kill-------------------
function stopStealthkill(sth)
    local atTeam = getTeamName(getPlayerTeam(sth))
        local dtTeam = getTeamName(getPlayerTeam(localPlayer))
        if atTeam=="President" and (dtTeam=="Police") then
                cancelEvent()
        elseif atTeam=="Police" and (dtTeam=="President" ) then
                cancelEvent()
        end
end
addEventHandler("onClientPlayerStealthKill", localPlayer, stopStealthkill)
