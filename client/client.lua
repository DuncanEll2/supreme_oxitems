RegisterNetEvent("supreme_oxitems:openDevTools")
AddEventHandler(
    "supreme_oxitems:openDevTools",
    function()
        local data =
            lib.inputDialog(
            "Enter Item Details",
            {
                {
                    type = "input",
                    label = "Item name (ex - water)",
                    icon = "",
                    required = true
                },
                {
                    type = "input",
                    label = "Item Label",
                    icon = "",
                    required = true
                },
                {
                    type = "slider",
                    label = "Weight",
                    icon = "",
                    required = true
                },
                {
                    type = "select",
                    label = "Stack",
                    icon = "",
                    required = true,
                    options = {
                        {value = "true", label = "True"},
                        {value = "false", label = "False"}
                    }
                },
                {
                    type = "select",
                    label = "Close",
                    icon = "",
                    required = true,
                    options = {
                        {value = "true", label = "True"},
                        {value = "false", label = "False"}
                    }
                },
                {
                    type = "select",
                    label = "Allow Armed",
                    icon = "",
                    required = true,
                    options = {
                        {value = "true", label = "True"},
                        {value = "false", label = "False"}
                    }
                },
                {
                    type = "input",
                    label = "Description",
                    icon = "",
                    required = true
                },
                {
                    type = "input",
                    label = "Image URL",
                    icon = "",
                    required = false
                }
            }
        )
        if data == nil then
            ---
        else
            TriggerServerEvent("supreme_oxitem:addItem", data[1], data[2], data[3], data[4], data[5], data[6], data[7])
            if not data[7] == nil then
                TriggerServerEvent("supreme_oxitem:addImage", data[1], data[8])
            end
        end
    end
)
