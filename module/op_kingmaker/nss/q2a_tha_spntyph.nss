//::///////////////////////////////////////////////
//:: Spawn-in Typhus
//:: q2a_tha_spntyph
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in Typhus
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept, 2003
//:://////////////////////////////////////////////

void main()
{
    object oTyphus = GetObjectByTag("q2_typhus");
    object oWay = GetObjectByTag("os_spawn_typhus");
    object oThaddeus = OBJECT_SELF;
    location lWay = GetLocation(oWay);
    ActionPauseConversation();
    CreateObject(OBJECT_TYPE_CREATURE,"typhus",lWay);
    AssignCommand(oTyphus,ActionMoveToObject(oThaddeus));
    ActionResumeConversation();
}
