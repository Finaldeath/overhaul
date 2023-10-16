//::///////////////////////////////////////////////
//:: Start Cutscene
//:: 2q6k_cutscene
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts Morag talking.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 18, 2002
//:://////////////////////////////////////////////
#include "nw_i0_hostincl"
void main()
{
    object oMorag = GetNearestObjectByTag("2Q6K_MORAG");
    object oMaugrim = GetNearestObjectByTag("2Q6K_Maugrim");
    if(GetIsObjectValid(oMorag))
    {
        AssignCommand(oMorag, ActionStartConversation(oMaugrim));
    }
}
