//::///////////////////////////////////////////////
//:: q6_greeter01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if greeters have spoken to player
*/
//:://////////////////////////////////////////////
//:: Created By:Drew Karpyshyn
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Greeters")==0;
    return iResult;
}
