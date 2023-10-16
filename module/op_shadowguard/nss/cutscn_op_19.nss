#include "help_general"
#include "help_hench"

void main()
{
    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_7");

    location lWP = GetLocation(oWP);

    object oMark = GetNearestObjectByTag("CS_OP_HENCH_MARK");

    object oPC = GetPCSpeaker();

    RemoveAllEffects(oPC);

    CutsceneJumpToWaypoint(oPC, 7);

    AssignCommand(oPC, DelayCommand(1.0, ActionMoveToObject(oMark, FALSE, 2.0)));

    AssignCommand(oPC, ActionPauseConversation());

    AssignCommand(oPC, DelayCommand(4.0, ActionResumeConversation()));
}
