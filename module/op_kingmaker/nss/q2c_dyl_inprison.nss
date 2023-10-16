//::///////////////////////////////////////////////
//:: Dylan Talked to
//:: q2c_dyl_inprison
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dylan has been talked to and has brought you to the prison
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_DYLAN_PRISON")==0;
    return iResult;
}
