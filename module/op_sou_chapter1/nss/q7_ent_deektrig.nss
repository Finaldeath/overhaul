//::///////////////////////////////////////////////
//:: Name q7_ent_deektrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        If the PC aquires the Mask before the Dragon Tooth -
        so kills Tymofarrar before J'Nah - then Deekin will
        disappear from Blumberg. After that point, he reappears
        in the High Forest after you exit J'Nah's dungeon
        (after killing her and getting the tooth)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 15/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{

    if (GetLocalInt(GetModule(), "X1_DeekinSpawn") == 2)
    {
        object oPC = GetEnteringObject();
        //do a henchman check
        if (GetMaster(oPC) != OBJECT_INVALID)
            oPC = GetMaster(oPC);
        if (GetIsPlayerCharacter(oPC) == TRUE)
        {
            //if the tooth has been recovered.
            if (GetLocalInt(GetModule(),"X1_RECOVERTOOTH") == 1)
            {
                //spawn in Deekin and have him talk to the PC.
                SetLocalInt(GetModule(), "X1_DeekinSpawn", 3);
                location lSpawn = GetLocation(GetWaypointByTag("wp_q7_deekin_spawn"));
                object oDeekin = CreateObject(OBJECT_TYPE_CREATURE, "q6deekin", lSpawn);
                //Start conversation
                SetLocalInt(oDeekin, "nJumpedOnce", 1);
                AssignCommand(oDeekin, ActionStartConversation(oPC));
            }
        }
    }

}
