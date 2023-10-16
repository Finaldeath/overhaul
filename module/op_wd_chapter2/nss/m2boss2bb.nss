//::///////////////////////////////////////////////
//:: Entered
//:: M2BOSS2BB
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: MARCH 13, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oBoss = GetNearestObjectByTag("M2Q2TROLLSHAM");
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered)||oBoss==oEntered)
    {
        AssignCommand(oBoss,SpeakOneLinerConversation());
        AssignCommand(oBoss,PlayAnimation(ANIMATION_FIREFORGET_TAUNT));
        AssignCommand(oBoss,DetermineCombatRound());
        DestroyObject(OBJECT_SELF);
    }
}
