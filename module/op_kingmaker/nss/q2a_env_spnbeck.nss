//::///////////////////////////////////////////////
//:: Spawn-in Beckett
//:: q2a_env_spnbeck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in Sir Becket
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oBecket = GetObjectByTag("q2_sirbecket");
    object oCut = GetWaypointByTag("km_cuttro_becket");
    AssignCommand(oBecket, ClearAllActions(TRUE));

    ActionPauseConversation();
    AssignCommand(oBecket,ActionMoveToObject(oCut));
    ActionResumeConversation();
}
