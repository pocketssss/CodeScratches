local function UpdateNW2Functions(ENTITY)
	local functions = {"Angle", "Bool", "Entity", "Vector", "Float", "Int", "String"}

	for i = 1, #functions do
		local functionName = functions[i]
		ENTITY["SetNW" .. functionName] = ENTITY["SetNW2" .. functionName]
		ENTITY["GetNW" .. functionName] = ENTITY["GetNW2" .. functionName]
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
