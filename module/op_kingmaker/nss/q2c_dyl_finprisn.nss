//::///////////////////////////////////////////////
//:: Prison Finished
//:: q2c_dyl_inprison
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

    iResult = GetLocalInt(OBJECT_SELF,"OS_DYLAN_PRISON")==2;
    return iResult;
}
