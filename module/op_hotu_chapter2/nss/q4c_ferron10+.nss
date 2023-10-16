//::///////////////////////////////////////////////
//:: q4c_ferron10+
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if Ferron Global is 10 or more (player has heard Ferron's offer)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Ferron")>=10;
    return iResult;
}
