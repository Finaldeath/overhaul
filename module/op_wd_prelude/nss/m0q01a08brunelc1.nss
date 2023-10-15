void main()
{
     ////////Give player key from inventory (NW_ROGUE_ITEM) then have Bruno escape area
    object oRogue = GetItemPossessedBy(OBJECT_SELF,"NW_ROGUE_ITEM");

    if(GetIsObjectValid(oRogue))
        {
            ActionGiveItem(oRogue,GetPCSpeaker());
        }
}
