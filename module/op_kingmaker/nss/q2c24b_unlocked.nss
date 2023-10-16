//::///////////////////////////////////////////////
//:: Prison Door Already Unlocked
//:: q2c24b_unlocked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The prisoner's cell is already unlocked
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Q2C24B_PRISON_UNLOCKED")==1;
    return iResult;
}
