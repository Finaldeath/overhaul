//::///////////////////////////////////////////////
//:: q2_elderbrain3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Player spoke to Elder Brain
   Gave mirror to Elder Brain
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"elder_brain")==3;
    return iResult;
}
