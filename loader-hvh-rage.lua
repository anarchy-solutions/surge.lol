-- [[ arg table, i hope i dont fuck this up 💔]] --
local games = {
    [1] = XXXXXXXXXXXXXX,
    [2] = XXXXXXXXXXXXXXXX,
    [3] = XXXXXXXXXXXXX,
}

for _, placeId in pairs(games) do
    if game.PlaceId == placeId then
        print("your current game is on the hvh/rage list:" .. game.PlaceID)
        break
    end
end
