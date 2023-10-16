//::///////////////////////////////////////////////
//:: Spawn-in Alias
//:: q2a_env_spnalias
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in Alias
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////

void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oPC = GetFirstPC();

    ActionPauseConversation();
    AssignCommand(oAlias, ActionMoveToObject(oPC, TRUE, 1.5f));
    ActionResumeConversation();
}

