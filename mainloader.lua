--[[
$$$$$$$\  $$\        $$$$$$\  $$\      $$\ $$$$$$$$\     $$\      $$\ $$$$$$$$\ $$$$$$$$\ 
$$  __$$\ $$ |      $$  __$$\ $$$\    $$$ |$$  _____|    $$ | $\  $$ |\__$$  __|$$  _____|
$$ |  $$ |$$ |      $$ /  $$ |$$$$\  $$$$ |$$ |          $$ |$$$\ $$ |   $$ |   $$ |      
$$$$$$$\ |$$ |      $$$$$$$$ |$$\$$\$$ $$ |$$$$$\        $$ $$ $$\$$ |   $$ |   $$$$$\    
$$  __$$\ $$ |      $$  __$$ |$$ \$$$  $$ |$$  __|       $$$$  _$$$$ |   $$ |   $$  __|   
$$ |  $$ |$$ |      $$ |  $$ |$$ |\$  /$$ |$$ |          $$$  / \$$$ |   $$ |   $$ |      
$$$$$$$  |$$$$$$$$\ $$ |  $$ |$$ | \_/ $$ |$$$$$$$$\ $$\ $$  /   \$$ |   $$ |   $$ |      
\_______/ \________|\__|  \__|\__|     \__|\________|\__|\__/     \__|   \__|   \__|      
                                                                                          
                                                                                                  
 THIS SCRIPT IS UNDER THE LICENSE OF MoonX Softworks. Refrain from reverse engineering, modifying or claiming the ownership of this product!
--]]

supported = {
    [1] = 2788229376,
    [2] = 10101010101,
    [3] = 111111111,
}

for _, placeId in pairs(supported) do
    if game.PlaceId == placeId then
        print("your current game is on the supported games' list!")
        task.wait(.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/anarchy-solutions/-blame.wtf/main/main.lua"))()
        break
    end
end

