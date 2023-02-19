local PANEL = {}
local sx, sy = input.GetCursorPos()
local HeadTimeRotate = 8

function PANEL:Init()
    self:SetSize(ScrW(), ScrH())
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(true)
    self:SetVisible(true)
    self:SetCursor("none")
end

function PANEL:Paint(w, h)
    draw.NoTexture()
    surface.SetDrawColor(Color(0, 0, 0))
    surface.DrawRect(0, 0, w, h)
end

function PANEL:OnCursorMoved(x, y)
    self.playerModelPanel.sxLerp = x
    self.playerModelPanel.syLerp = y
end

function PANEL:PreDrawModel(ent)
    local head = ent:LookupBone("ValveBiped.Bip01_Head1")
    local pos, angle = ent:GetBonePosition(head)
    if not head then return end -- Use "not" instead of "< 0" to check if head is nil

    self.sxLerp = Lerp(FrameTime() * HeadTimeRotate, self.sxLerp or sx, sx) -- Use self.sxLerp or sx as initial value to avoid errors
    self.syLerp = Lerp(FrameTime() * HeadTimeRotate, self.syLerp or sy, sy)

    local normalizedVector = util.AimVector(Angle(0, 180, 0), 90, -self.sxLerp, self.syLerp, ScrW() * 1, ScrH() * 1)
    angle:RotateAroundAxis(Vector(0, 1, 0), (-math.asin(normalizedVector.z * 2) * 90) - 10)
    angle:RotateAroundAxis(Vector(0, 0, 1), (math.atan2(normalizedVector.y * 1, normalizedVector.x * 6) * 180))
    angle:RotateAroundAxis(Vector(0, 0, 1), 90 - (sx / ScrW()))

    ent:SetBonePosition(head, pos, angle)
end

function PANEL:SetPlayerModel(model)
if self.playerModelPanel then self.playerModelPanel:Remove() end
    self.playerModelPanel = vgui.Create("DModelPanel", self)
    self.playerModelPanel:SetModel(model)
    self.playerModelPanel:Dock(FILL)
    self.playerModelPanel:SetCamPos(Vector(70, 0, 50))
    self.playerModelPanel:SetLookAt(Vector(0, 0, 50))
    self.playerModelPanel.LayoutEntity = function() end
        self.playerModelPanel.PreDrawModel = function(_, ent)
            PANEL:PreDrawModel(ent)
        end
end

vgui.Register("RotateModel", PANEL, "EditablePanel")


// Usage / Example 
//
// local rotateModelPanel = vgui.Create("RotateModel")
// rotateModelPanel:SetPlayerModel("models/player.mdl") 
//
// Usage / Exmaple 
