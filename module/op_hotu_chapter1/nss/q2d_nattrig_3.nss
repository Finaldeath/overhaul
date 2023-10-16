//::///////////////////////////////////////////////
//:: Name q2d_nattrig_3
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
    if (GetLocalInt(GetModule(), "X2_Q2DNathyrra_1") == 3)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(GetModule(), "X2_Q2DNathyrra_1", 3);

    //Spawn in Nathyrra
    location lSpawn = GetLocation(GetNearestObjectByTag("wp_q2dnathspawn_3"));
    object oNath = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_nathyrra", lSpawn);
    //Send message to PC
    FloatingTextStrRefOnCreature(84137 , oPC);
    //Stop the PC from running away without talking to Nathyrra
    AssignCommand(oPC, ClearAllActions(TRUE));
    object oArea = GetArea(oPC);
    AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 3.0));
    //Nathyrra talks to the PC
    AssignCommand(oNath, ActionStartConversation(oPC));

    //HENCHMAN INTERJECTION
    AttemptInterjectionOrPopup(OBJECT_SELF, "x2_oneliner_nr", oPC, 15);
}
