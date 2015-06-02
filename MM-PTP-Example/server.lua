-----------------------------------------------------------------
-----block president from buying or enterring these vehicles-----
-----------------------------------------------------------------

local blocklist = {
	
[425] = true, -- Hunter
[520] = true, -- Hydra
[487] = true, -- Maverick
[488] = true, -- News Chopper
[497] = true, -- Police Maverick
[476] = true, -- Rustler
[447] = true, -- Seasparrow
[469] = true, -- Sparrow 
[473] = true -- Dinghy	

}

addEventHandler( "onVehicleStartEnter", root,
	function(player, seat, jacked)
	   if seat == 0 then
    local pteam = getPlayerTeam(player)
			if getTeamName(pteam) == "President" then
				if blocklist[getElementModel(source)] then
					cancelEvent()
					outputChatBox("[Info]:The President cannot drive this vehicle!", player)
				end
			end
		end
	end
)

addEventHandler("onPlayerShopBuy", root,
	function(item, price, id)
		local pteam = getPlayerTeam(source)
		if pteam and getTeamName(pteam) == "President" then
			if item.type == "vehicle" and (blocklist[item.id]) then
				cancelEvent()
				exports.minim_shop:outputShopMessage("[Info]: The President cannot buy this item.", source)
			end
		end
	end
)


--------------------------------------------------
-----Disable items from the shop-------
--------------------------------------------------

addEventHandler( "onResourceStart", resourceRoot,
	function()
		local disableditems = {1,--bmx
                                       6, -- News Chopper
                                       14, -- Rustler
                                       16, -- Hydra
                                       17, -- Seasparrow
                                       18, -- Raino
                                       19,-- Hunter
                                       49, -- Air strike
                                       54 -- RC Baron
}
		for i=1,#disableditems do
			exports.minim_shop:setShopItemData(disableditems[i], {disabled = true})
		end
)


