//::///////////////////////////////////////////////
//:: Name: q2b_find_trapcst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Those who succeed in a Spellcraft check will
    notice the illusionary magic on the trapped
    chests.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Dec 10/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    if (GetLocalInt(oPC, "X2_Q2BMagicSecretRoom") == 1)
        return;
    if (GetLocalInt(OBJECT_SELF, "nSkillCheckDone") == 1)
        return;

    SetLocalInt(oPC, "X2_Q2BMagicSecretRoom", 1);
    if (GetIsSkillSuccessful(oPC, SKILL_SPELLCRAFT, 20) && GetIsObjectValid(GetObjectByTag("q2b_trapchest4")) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nSkillCheckDone", 1);
        object oMessage = GetObjectByTag("q2b_trig_trapchest");
        AssignCommand(oMessage, SpeakOneLinerConversation());
    }
}
