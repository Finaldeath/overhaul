//::///////////////////////////////////////////////
//:: q4c_Aghaaz10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if Aghaaz Global is 10 or more (player has heard Aghaaz's offer)
  And checks if Aghaaz is still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Aghaaz")>=10 &&
              GetLocalInt(GetModule(),"Ferron")!=99 &&
              !(!GetIsObjectValid(GetObjectByTag("q4c_aghaaz"))
              || GetIsDead(GetObjectByTag("q4c_aghaaz")));
    return iResult;
}


