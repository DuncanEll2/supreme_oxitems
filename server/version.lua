local resourceName = GetCurrentResourceName()

local currentVersion = '1.1.6'

function checkVersion()
    PerformHttpRequest("https://raw.githubusercontent.com/DuncanEll2/supreme_oxitems/main/version.txt", function(err, response, headers)
        if err == 200 then
            local latestVersion = response:match("^%s*(.-)%s*$") -- Trim any whitespace from the response

            if latestVersion ~= currentVersion then
                print("^3[" .. resourceName .. "] ^1Your script is outdated! Current version: " .. currentVersion .. ", Latest version: " .. latestVersion .. ". Please update it from GitHub.^7")
            else
                print("^3[" .. resourceName .. "] ^2You are using the latest version: " .. currentVersion .. ".^7")
            end
        else
            print("^3[" .. resourceName .. "] ^1Failed to check for updates. HTTP Error Code: " .. err .. ".^7")
        end
    end, "GET", "", {["User-Agent"] = "supreme_emotes"})
end

-- Run the version check when the resource is started
AddEventHandler("onResourceStart", function(resource)
    if resource == resourceName then
        checkVersion()
    end
end)