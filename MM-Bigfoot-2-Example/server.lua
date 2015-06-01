--------------------No Enter Before Download-----------------

local players = {}
addEvent("onMiniMissionsClientReady", true)
addEventHandler("onMiniMissionsClientReady", root,
function()
if not players[client] then
players[client] = true
end
end
)
 
addEventHandler("onPlayerQuit", root,
function()
if players[source] then
players[source] = nil
end
end
)
 
addEventHandler("onMiniMissionsAttemptSpawn", root,
function()
if not players[source] then
cancelEvent(true,"~r~Please wait for all downloads to complete~n~~r~before joining a team.")
end
end
)

---------------------------hide bilps for Bigfoot---------------------

addEventHandler ( "onResourceStart", resourceRoot,
    function ( )
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            local attached = getAttachedElements (player)
                if ( attached ) then
                local playerTeam = getPlayerTeam(player)
                if (playerTeam) then
                    if ( getTeamName (playerTeam) == "Bigfoot" ) then
                        for _, element in ipairs (attached) do
                            if (getElementType (element) == "blip" ) then
                            destroyElement ( element )
                           
                        end
                    end
                end
            end
       end
    end
end)
addEventHandler ( "onPlayerSpawn", getRootElement(),
    function ( )
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            local attached = getAttachedElements (player)
                if ( attached ) then
                local playerTeam = getPlayerTeam(player)
                if (playerTeam) then
                    if ( getTeamName (playerTeam) == "Bigfoot" ) then
                        for _, element in ipairs (attached) do
                            if (getElementType (element) == "blip" ) then
                            destroyElement ( element )
                           
                        end
                    end
                end
            end
       end
    end
end)
