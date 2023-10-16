//::///////////////////////////////////////////////
//:: Name q1rural_ent_dtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of the trigger - if the PC has
    not seen Deekin yet - Deekin will
    spawn in and talk to the PC
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Mar 5/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(GetModule(), "X1_DeekinSpawn") == 0)
    {
        SetLocalInt(GetModule(), "X1_DeekinSpawn", 1);
        location lSpawn = GetLocation(GetNearestObjectByTag("wp_deekinspawn"));
        object oDeekin = CreateObject(OBJECT_TYPE_CREATURE, "q6deekin", lSpawn);
        //Conversation outside of blumberg
        if (GetTag(GetArea(oPC)) == "q1rural")
            SetLocalInt(oDeekin, "q6_Deekin_Chases_PC", 1);

        if (IsInConversation(oDeekin) == FALSE)
            AssignCommand(oDeekin, ActionStartConversation(oPC));
    }

}
