//::///////////////////////////////////////////////
//:: q6_guardsad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Marks the guard has been told his wife is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 04, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"GuardSad")==10;
    return iResult;
}
