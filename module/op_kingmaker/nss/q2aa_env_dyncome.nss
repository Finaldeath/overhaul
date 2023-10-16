//::///////////////////////////////////////////////
//::
//:: q2aa_env_dyncome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dyschall walks over to Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oDyn = GetObjectByTag("q2_dynschall");
    object oCut = GetWaypointByTag("km_cuttro_dyncshall");
    AssignCommand(oDyn, ClearAllActions(TRUE));

    ActionPauseConversation();
    AssignCommand(oDyn, ActionMoveToObject(oCut));
    ActionResumeConversation();

}
