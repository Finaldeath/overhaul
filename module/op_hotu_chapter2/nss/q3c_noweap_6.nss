//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Not Carrying Weapon, Random 6 (Condition Script)
//:: Q3c_NoWeap_6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has no weapon
     equipped and the Randomizer is set to 6.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (oWeapon == OBJECT_INVALID &&
        nRandom == 6)
    {
        return TRUE;
    }
    return FALSE;
}
