//::///////////////////////////////////////////////
//:: William Rey (Condition - Wise Wind)
//:: C_William_Wind.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has the Wise Wind.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oWind = GetItemPossessedBy(oPC, "ITEM_WiseWind");

    if (oWind != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
