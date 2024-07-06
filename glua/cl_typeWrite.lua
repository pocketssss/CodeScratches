local debug = false 
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
                if debug then
                    print(("Error: startByte is nil for offset %d"):format(offset))
                end
                timer.Remove(timerName)
                return
            end

            str = str .. text:sub(startByte, endByte)
            if debug then
                print(("Adding character '%s', current string: '%s'"):format(text:sub(startByte, endByte), str))
            end
            callback(str, offset)
            
            offset = offset + 1
        else
            if debug then
                print("Typing completed.")
            end
            timer.Remove(timerName)
        end
    end

    if offset <= len then
        if debug then
            print(("Creating timer '%s' for text length %d"):format(timerName, len - offset + 1))
        end
        timer.Create(timerName, speed, len - offset + 1, typeNextCharacter)
    end
end
