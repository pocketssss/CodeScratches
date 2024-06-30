function HaveEntClassInRadius(entclass, pos, range)
	local entsInRange = ents.FindInSphere(pos, range)
	for i = 1, #entsInRange do
		local ent = entsInRange[i]
		if ent:GetClass() == entclass then
			return true
		end
	end
	return false
end

function DistanceToEnt(ent1, ent2, dist)
	local distSqr = dist * dist
	local ent1Pos = ent1:GetPos()
	local ent2Pos = ent2:GetPos()
	return ent1Pos:DistToSqr(ent2Pos) <= distSqr
end
