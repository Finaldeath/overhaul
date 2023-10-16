//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: act_q1hkobold_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
   ..and add change so they attack Walther too..
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"

void main()
{
    //object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();
    FloatingTextStrRefOnCreature(40413, oPC);
    SetIsTemporaryEnemy(oPC, oKobold);
    SetIsTemporaryEnemy(oBlake, oKobold);
    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 0, oKobold);
    AssignCommand(oKobold, DetermineCombatRound());


    SetLocalInt(GetModule(), "X1_Q1HBabyDead", 1);
    SetLocalInt(oKobold, "nBabyMessage", 1);
    AddJournalQuestEntry("q1bfamily", 30, oPC);
    SetLocalInt(oBlake, "nFollow", 0);

}
