//::///////////////////////////////////////////////
//:: q6_apprendead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the wizard's apprentice is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = (!GetIsObjectValid(GetObjectByTag("q6_jansil"))
              || GetIsDead(GetObjectByTag("q6_jansil"))
              &&  GetLocalInt(OBJECT_SELF,"Jansil_Dead")==0);
    return iResult;
}

