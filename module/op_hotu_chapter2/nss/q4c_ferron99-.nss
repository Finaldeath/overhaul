//::///////////////////////////////////////////////
//:: q4c_ferron99-
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if Ferron Global doesn't equal 99 (player has not given Ferron the Power Source)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Ferron")!= 99;
    return iResult;
}



