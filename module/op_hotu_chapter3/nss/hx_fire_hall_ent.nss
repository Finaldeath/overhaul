//::///////////////////////////////////////////////
//:: Name hx_fire_hall_ent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will fire a conversation for the player
     to let them know that walking over the fire
     is not a good idea.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
void main()
{
     object oPC = GetEnteringObject();
     object oInvis = GetObjectByTag("hx_firehall_invis");

     if(GetIsPC(oPC))
     {
        if(CheckFlier(oPC) == FALSE)
        {
            if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oInvis, ActionStartConversation(oPC));
            }
        }
     }
}
