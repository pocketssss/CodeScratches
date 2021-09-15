local HeadTimeRotate = 8 

function PANEL:PreDrawModel = function(ent) 

    local head = ent:LookupBone("ValveBiped.Bip01_Head1") 
    if head < 0 then return end -- if head = nil then return end 

    local pos,angle = ent:GetBonePosition( head )   -- pose your bone 
    local sx,sy = input.GetCursorPos() -- get cordinats x and y 

    self.sxLerp = Lerp(FrameTime() * HeadTimeRotate , PlayerModel.sxLerp,sx); -- lerp move head to pos your mouse to horizontal
    self.syLerp = Lerp(FrameTime() * HeadTimeRotate , PlayerModel.syLerp,sy); -- lerp move head to pos your mouse to vertical 

    local normalizedVector = util.AimVector(Angle(0,180,0),90,-self.sxLerp,self.syLerp , ScrW() * 1 ,ScrH() * 1); -- get normalizedVector 
    normalizedVector = normalizedVector -- anti error :3

    angle:RotateAroundAxis(Vector(0,1,0), (-math.asin( normalizedVector.z * 2 )  * 90) - 10  ); 
    angle:RotateAroundAxis(Vector(0,0,1), (math.atan2(normalizedVector.y  * 1,normalizedVector.x * 6) * 180))
    angle:RotateAroundAxis(Vector(0,0,1), 90 - (sx / ScrW()))

    ent:SetBonePosition(head, pos, angle)
 end