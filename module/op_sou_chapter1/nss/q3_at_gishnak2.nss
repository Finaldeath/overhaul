// Action taken for Gishnak: give 200gp and his weapon to player

void main()
{
    object oWeapon = GetItemPossessedBy(OBJECT_SELF, "NW_WDBAX001");
    if(oWeapon != OBJECT_INVALID)
        ActionGiveItem(oWeapon, GetPCSpeaker());
    GiveGoldToCreature(GetPCSpeaker(), 200);
}
