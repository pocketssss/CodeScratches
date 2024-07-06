function surface.TypeWriting(text, speed, callback)
    local timerName = ("TypeWriting:%s:%d"):format(util.CRC(text), SysTime())
    local str = ""
    local offset = 0
    local len = utf8.len(text)

    local function typeNextCharacter()
        if offset <= len then
            local startByte = utf8.offset(text, offset)
            local endByte = utf8.offset(text, offset + 1)

            if startByte and endByte then
                endByte = endByte - 1
            elseif startByte then
                endByte = #text 
            else
                print("Error: startByte is nil")
                timer.Remove(timerName)
                return
            end

            str = str .. text:sub(startByte, endByte)
            callback(str, offset)
            
            offset = offset + 1
        else
            timer.Remove(timerName)
        end
    end

    if offset <= len then
        timer.Create(timerName, speed, len - offset + 1, typeNextCharacter)
    end
end
