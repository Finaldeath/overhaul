//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Player is Naked (Condition Script)
//:: Q3c_Naked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is naked.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oClothes = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);

    if (oClothes == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
