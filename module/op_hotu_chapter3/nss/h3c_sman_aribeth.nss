//::///////////////////////////////////////////////
//:: Sleeping Man, Aribeth in Party (Condition Script)
//:: H3c_SMan_Aribeth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is in the same area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetNearestObjectByTag("H2_Aribeth");

    if (oAribeth != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
