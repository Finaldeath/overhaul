//::///////////////////////////////////////////////
//:: Prison Finished
//:: con_pri_finish
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the prison levels
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oDylan = GetObjectByTag("q2_dylan");
    iResult = GetLocalInt(oDylan,"OS_DYLAN_PRISON")>=2;
    return iResult;
}
