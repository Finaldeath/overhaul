//::///////////////////////////////////////////////
//:: con_jab_nohome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has not bought the haunted house yet
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oSerah = GetObjectByTag("q2_serah");
    iResult = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 20;
    return iResult;
}
