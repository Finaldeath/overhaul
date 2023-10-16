//Move to Stage 7 of the opening cutscene.

#include "help_general"

void main()
{
    //Define the current cutscene stage
    int iStage = 7;

    //Update their cutscene stage.
    object oPC = GetPCSpeaker();
//    SetLocalInt(oPC, "iOpeningCutscene", iStage);

    //Pause conversation as it continues after the jump.
//    AssignCommand(oPC, ActionPauseConversation());

    //Fade to Black to hide the jump
//    FadeToBlack(oPC, FADE_SPEED_FASTEST);

    //Jump them to the corresponding waypoint
    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_"+IntToString(iStage), oPC);
//    DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oWP)));

    //Remove their effects to make them visible again.
    RemoveAllEffects(oPC);

    //Move them to Markius
    object oMark = GetNearestObjectByTag("CS_OP_HENCH_MARK");
//    AssignCommand(oPC, DelayCommand(1.0, ActionMoveToObject(oMark, FALSE, 2.0)));

    //Resume the conversation
//    AssignCommand(oPC, DelayCommand(4.0, ActionResumeConversation()));
}
