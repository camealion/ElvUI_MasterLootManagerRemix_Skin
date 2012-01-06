local SkinMLM = CreateFrame("Frame")
	SkinMLM:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinMLM:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("MasterLootManagerRemix") then return end
	
	local StripAllTextures = {
				"MasterLootManagerMain",
				}

	local SetTemplateD = { -- Default Texture
				--"",
				}

	local SetTemplateT = {-- Transparent Texture
				"MasterLootManagerMain",
				"MasterLootManagerMain_ScrollFrame",
				}	

	local buttons = {
				"MasterLootManagerMain_Countdown",
				"MasterLootManagerMain_SelectItem",
				"MasterLootManagerMain_AnnounceLoot",
				"MasterLootManagerMain_AnnounceMainSpec",
				"MasterLootManagerMain_AnnounceOffSpec",
				"MasterLootManagerMain_AnnounceNoSpec",
				"MasterLootManagerMain_AwardLoot",
				"MasterLootManagerMain_Settings",
				"MasterLootManagerMain_AssignDE",
				"MasterLootManagerMain_AssignBank",
				}

	for _, object in pairs(StripAllTextures) do
                _G[object]:StripTextures()
	end	

	for _, object in pairs(SetTemplateD) do
				_G[object]:SetTemplate("Default")
	end	

	for _, object in pairs(SetTemplateT) do
				_G[object]:SetTemplate("Transparent")
	end	

	-- Skin Buttons
	for _, button in pairs(buttons) do
					cSkinButton(_G[button])
	end	

	-- Move this
		MasterLootManagerMain_AssignDE:Point("TOPLEFT",  MasterLootManagerMain_SelectDE, "TOPRIGHT", 10, -2)
		MasterLootManagerMain_AssignBank:Point("TOPLEFT",  MasterLootManagerMain_SelectBank, "TOPRIGHT", 10, -2)
		MasterLootManagerMain_ScrollFrame:Point("TOPLEFT", MasterLootManagerMain, "TOPLEFT", 10, -105)
		MasterLootManagerMain_ScrollFrame:Point("TOPRIGHT", MasterLootManagerMain, "TOPRIGHT", -26, -105)

	-- Skin Dropdowns 
		cSkinDropDownBox(MasterLootManagerMain_SelectDE, 150)
		cSkinDropDownBox(MasterLootManagerMain_SelectBank, 150)
		
	-- Scrollbar
		cSkinScrollBar(MasterLootManagerMain_ScrollFrame_Slider, 5)	
end)