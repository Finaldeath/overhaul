//::///////////////////////////////////////////////
//:: Entered
//:: M2BOSS
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
    object oBoss = GetNearestObjectByTag("M1Q3_BossThug");
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered)||oBoss==oEntered)
    {
        AssignCommand(oBoss,SpeakOneLinerConversation());
        DestroyObject(OBJECT_SELF);
    }
}
