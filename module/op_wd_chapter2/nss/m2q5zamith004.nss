//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5ZAMITH004
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra and her guards attack the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 14, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oGuard1 = GetNearestObjectByTag("M2Q05CZAMITHGRD",OBJECT_SELF,1);
    object oGuard2 = GetNearestObjectByTag("M2Q05CZAMITHGRD",OBJECT_SELF,2);
    object oGuard3 = GetNearestObjectByTag("M2Q05CZAMITHGRD",OBJECT_SELF,3);
    object oWitless = GetObjectByTag("M2Q1CWITL");

    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    AdjustReputation(GetPCSpeaker(),oGuard1,-100);
    AssignCommand(oGuard1,DetermineCombatRound());
    AssignCommand(oGuard2,DetermineCombatRound());
    AssignCommand(oGuard3,DetermineCombatRound());
    AssignCommand(oWitless,DetermineCombatRound());
    DetermineCombatRound();
}
