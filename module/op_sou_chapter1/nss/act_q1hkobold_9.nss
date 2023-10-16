//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: act_q1hkobold_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
   ..but the kobold doesn't have the baby - so it
   just attacks..
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"

void main()
{

    object oKobold = GetObjectByTag("q1h2_kblake");

    object oPC = GetPCSpeaker();

    SetIsTemporaryEnemy(oPC, oKobold);

    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 0, oKobold);
    AssignCommand(oKobold, DetermineCombatRound());



    SetLocalInt(oKobold, "nBabyMessage", 1);



}
