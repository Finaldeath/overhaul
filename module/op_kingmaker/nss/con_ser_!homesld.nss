//::///////////////////////////////////////////////
//:: Home not sold
//:: con_ser_!homesld
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the haunted house isn't sold yet
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult1, iResult2;
    object oPC = GetFirstPC();

    iResult1 = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 20;
    iResult2 = GetLocalInt(oPC,"os_serahcaves") > 0;

    if ((iResult1) && (iResult2))
    {
        return TRUE;
    }

    return FALSE;
}
