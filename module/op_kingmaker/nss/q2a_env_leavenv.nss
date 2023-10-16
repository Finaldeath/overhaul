//::///////////////////////////////////////////////
//:: Enivid Leaves
//:: q2a_env_leaveeni
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid leaves. Give PC 500 xp for joining election.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
#include "inc_remeffect"

void main()
{
    object oEnivid = OBJECT_SELF;
    object oPC = GetFirstPC();
    object oDylan = GetNearestObjectByTag("kmcut_dylan");

    object oDoorDylan = GetObjectByTag("q2ac_at_q2ac24");
    object oDoorEnivid = GetObjectByTag("q2ac_at_q2ac25a");
    object oGuildHall = GetObjectByTag("q2c25b_way_enivd");

    location lPC = GetLocation(oPC);
    object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lPC);

    RemovePoly(oPC);

    AssignCommand(oDylan, ClearAllActions(TRUE));

    AssignCommand(oEnivid, ActionMoveToObject(oDoorEnivid));
    AssignCommand(oDylan, ActionMoveToObject(oDoorDylan));

    AssignCommand(oDylan, DestroyObject(oDylan, 5.0f));
    AssignCommand(oEnivid, ActionJumpToObject(oGuildHall));

    GiveXPToCreature(GetFirstPC(), 500);
    AssignCommand(oPC, ClearAllActions(TRUE));

    SetLocalInt(oMW, "OS_MW_ELECTION", 1);
    SetLocalInt(oPC, "OS_PC_ELECTION", 10);

    DelayCommand(1.0,AssignCommand(oMW, ActionStartConversation(oPC)));

    AddJournalQuestEntry("q1_magicweapon", 30, oPC);
}
