//::///////////////////////////////////////////////
//:: Witchwork 1: DM Only condition
//:: WW1_DM_Only_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if PCSpeaker is a DM.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 6, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetIsDM(oPC) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
