//::///////////////////////////////////////////////
//:: Name q2d_nattrig_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Nathyrra will appear to the PC the first time

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////
#include "x2_inc_banter"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    if (GetLocalInt(GetModule(), "X2_Q2DNathyrra_1") > 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;


    SetLocalInt(GetModule(), "X2_Q2DNathyrra_1", 2);
    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

    location lSpawn = GetLocation(GetNearestObjectByTag("wp_q2dnathspawn_2"));
    object oNath = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_nathyrra", lSpawn);
    FloatingTextStrRefOnCreature(84137 , oPC);
    AssignCommand(oPC, ClearAllActions(TRUE));
    //Stop the PC from running away without talking to Nathyrra
    object oArea = GetArea(oPC);
    AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 3.0));

    //HENCHMAN INTERJECTION
    AttemptInterjectionOrPopup(OBJECT_SELF, "x2_oneliner_nr", oPC, 14);

    AssignCommand(oNath, ActionStartConversation(oPC));
}
