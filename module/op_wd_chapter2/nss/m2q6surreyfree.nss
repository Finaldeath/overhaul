//::///////////////////////////////////////////////
//:: Unlocked
//:: m2q6SurreyFree
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Surrey is freed, he speaks and leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    AssignCommand(GetObjectByTag("M2Q6CSURR"),SetLocalInt(OBJECT_SELF,"NW_L_Freed",10));
    AssignCommand(GetObjectByTag("M2Q6CSURR"),ActionStartConversation(GetNearestPC()));
}
