//::///////////////////////////////////////////////
//:: q6_medusadead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the medusa is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetObjectByTag("q6_quathala"))
              || GetIsDead(GetObjectByTag("q6_quathala"));
    return iResult;
}
