//::///////////////////////////////////////////////
//:: move feran
//:: q2a_env_spnferan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves feran for the post battle feild conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oMomma = GetObjectByTag("q2_feran");
    object oCut = GetWaypointByTag("km_cuttro_feran");
    AssignCommand(oMomma, ClearAllActions(TRUE));

    ActionPauseConversation();
    AssignCommand(oMomma, ActionMoveToObject(oCut));
    ActionResumeConversation();
}
