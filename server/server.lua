RegisterServerEvent("supreme_oxitem:addItem")
AddEventHandler(
    "supreme_oxitem:addItem",
    function(name, label2, weight, stack, close, allowarmed, description)
        print(name, label2, weight, stack, close, allowarmed, description)
        if IsPlayerAceAllowed(source, "oxitems") then
            local src = source
            local path = GetResourcePath("ox_inventory")
            path = path:gsub("//", "/") .. "/data/items.lua"

            -- Open the file for reading
            local file = io.open(path, "r")
            local lines = {}
            for line in file:lines() do
                table.insert(lines, line)
            end
            table.remove(lines)
            file:close()
            file = io.open(path, "w")
            file:write(table.concat(lines, "\n "))

            file:close()
            -- Removes Last Line
            Wait(1000)

            file = io.open(path, "a+")
            if not itemname then
                label = "\n   ['" .. name .. "'] = {\n"
            else
                label = "\n\n-- " .. itemname .. "\n[]"
            end
            file:write(label)
            file:write(
                "     label = '" ..
                    label2 ..
                        "',\n     " ..
                            "weight = " ..
                                weight ..
                                    ",\n     " ..
                                        "stack = " ..
                                            stack ..
                                                ",\n     " ..
                                                    "close = " ..
                                                        close ..
                                                            ",\n     " ..
                                                                "allowArmed = '" ..
                                                                    allowarmed ..
                                                                        "',\n    " ..
                                                                            "description = '" .. description .. "',\n"
            )
            file:write("},\n}")
            file:close()
        end
    end
)

RegisterServerEvent("supreme_oxitem:addImage")
AddEventHandler(
    "supreme_oxitem:addImage",
    function(name, url)
        if IsPlayerAceAllowed(source, "oxitems") then
            PerformHttpRequest(
                url,
                function(errorCode, imageData, resultHeaders)
                    local path = GetResourcePath("ox_inventory")
                    path = path:gsub("//", "/") .. "/web/images/" .. name .. ".png"
                    local f = assert(io.open(path, "wb")) -- open in "binary" mode
                    f:write(imageData)
                    f:close()
                end
            )
        end
    end
)

RegisterCommand(
    "oxdevtools",
    function(source)
        if IsPlayerAceAllowed(source, "oxitems") then
            TriggerClientEvent("supreme_oxitems:openDevTools", source)
        else
           print("not allowed")
        end
    end
)
