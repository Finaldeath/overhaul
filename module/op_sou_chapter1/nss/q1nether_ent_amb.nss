//::///////////////////////////////////////////////
//:: Name  q1nether_ent_amb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     if the PC has pissed off the farmhand at the
     Hurst farm and has hit the trigger down by
     the kobold cave - then this trigger will
     spawn the ambush
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 9/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(GetModule(), "X1_Q1RURALAMBUSH") == 1 && GetLocalInt(GetModule(), "X1_PCVISITQ1NETHERCAVE") == 1 && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            //Generate the ambush
            location lAmbush = GetLocation(GetWaypointByTag("wp_q1nether_ambush"));
            object oFarmhand = CreateObject(OBJECT_TYPE_CREATURE, "q1ff_hand", lAmbush);
            object oBandit1 = CreateObject(OBJECT_TYPE_CREATURE, "nw_bandit001", lAmbush);
            object oBandit2 = CreateObject(OBJECT_TYPE_CREATURE, "nw_bandit001", lAmbush);
            DelayCommand(2.0, AssignCommand(oFarmhand, SpeakStringByStrRef(40348, TALKVOLUME_SHOUT)));
            AssignCommand(oFarmhand, ActionAttack(oPC));
            AssignCommand(oBandit1, ActionAttack(oPC));
            AssignCommand(oBandit2, ActionAttack(oPC));
        }

    }
}
