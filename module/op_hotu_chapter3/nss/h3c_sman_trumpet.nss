//::///////////////////////////////////////////////
//:: Sleeping Man, PC Trumpet in Inventory (Condition Script)
//:: H3c_SMan_Trumpet.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the Trumpet of
     Pendemonium in their inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oTrumpet = GetItemPossessedBy(oPC, "H2_Trumpet");
    if (oTrumpet != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
