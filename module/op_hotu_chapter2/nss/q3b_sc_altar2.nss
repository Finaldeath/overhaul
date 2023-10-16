// returns TRUE if the player has a black pearl.

#include "x2_inc_itemprop"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int nType = GetBaseItemType(oWeapon);
    // if the held item is not a weapon then do nothing
    if(oWeapon == OBJECT_INVALID || !IPGetIsMeleeWeapon(oWeapon))
        return FALSE;
     // only once per weapon
    int nOnce = GetLocalInt(oWeapon, "q3b_EffectedByAltar");
    if(nOnce == 1)
        return FALSE;
    SetLocalInt(oWeapon, "q3b_EffectedByAltar", 1);

    return TRUE;
}
