//::///////////////////////////////////////////////
//:: q4c_Aghaaz99
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if Aghaaz Global is 99 or more (player has delivered Ferron's head)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Aghaaz")==99;
    return iResult;
}


