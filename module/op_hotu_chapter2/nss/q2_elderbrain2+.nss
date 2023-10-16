//::///////////////////////////////////////////////
//:: q2_elderbrain2+
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Player spoke to Elder Brain, agreed to get the mirror
   OR player has given mirror already
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 17, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"elder_brain")>=2;
    return iResult;
}

