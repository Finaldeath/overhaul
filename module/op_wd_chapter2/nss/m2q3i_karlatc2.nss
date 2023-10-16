//::///////////////////////////////////////////////
//:: m2q3I Karlat Condition Script #2
//:: m2q3I_KarlatC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is carrying
    Karlat's Journal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "m2q3I_JournKarlat") != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
