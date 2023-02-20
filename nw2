local NW2Functions = {
	["Angle"] = true,
	["Bool"] = true,
	["Entity"] = true,
	["Vector"] = true,
	["Float"] = true,
	["Int"] = true,
	["String"] = true,
}

local function UpdateNW2Functions(ENTITY)
	for k, v in pairs(NW2Functions) do
		ENTITY["SetNW" .. k] = ENTITY["SetNW2" .. k]
		ENTITY["GetNW" .. k] = ENTITY["GetNW2" .. k]
	end

	ENTITY.SetNetworkedNumber = ENTITY.SetNW2Int
	ENTITY.SetNetworkedEntity = ENTITY.SetNW2Entity
	ENTITY.GetNetworkedString = ENTITY.GetNW2String
	ENTITY.SetNetworkedInt = ENTITY.SetNW2Int
	ENTITY.SetNetworkedBool = ENTITY.SetNW2Bool
	ENTITY.SetNetworkedVector = ENTITY.SetNW2Vector
	ENTITY.SetNetworkedVar = ENTITY.SetNW2Var
	ENTITY.SetNetworkedFloat = ENTITY.SetNW2Float
	ENTITY.SetNetworkedString = ENTITY.SetNW2String
	ENTITY.GetNetworkedEntity = ENTITY.GetNW2Entity
	ENTITY.GetNetworkedBool = ENTITY.GetNW2Bool
	ENTITY.GetNetworkedVector = ENTITY.GetNW2Vector
	ENTITY.GetNetworkedInt = ENTITY.GetNW2Int
	ENTITY.GetNetworkedFloat = ENTITY.GetNW2Float
	ENTITY.GetNetworkedVar = ENTITY.GetNW2Var
	ENTITY.SetNetworkedAngle = ENTITY.SetNW2Angle
	ENTITY.GetNetworkedAngle = ENTITY.GetNW2Angle
end

hook.Add("Initialize", "UpdateNW2Functions", function()
	UpdateNW2Functions(ENT)
end)
