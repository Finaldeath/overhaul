//::///////////////////////////////////////////////
//:: Spawn-in Mommaji
//:: q2a_env_spnmomma
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in Momma Ji
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oMomma = GetObjectByTag("q2_mommaji");
    object oCut = GetWaypointByTag("km_cuttro_dane");
    AssignCommand(oMomma, ClearAllActions(TRUE));

    ActionPauseConversation();
    AssignCommand(oMomma, ActionMoveToObject(oCut));
    ActionResumeConversation();
}
