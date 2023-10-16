//Move to Stage 2 of the opening cutscene.

void main()
{
    //Define the current cutscene stage
    int iStage = 2;

    //Update their cutscene stage.
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iOpeningCutscene", iStage);

    //Fade to Black to hide the jump
    FadeToBlack(oPC, FADE_SPEED_FASTEST);

    //Jump them to the corresponding waypoint
    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_"+IntToString(iStage), oPC);
    DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oWP)));

    //Fire the conversation
    DelayCommand(1.0, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", TRUE, FALSE)));

    //Reset their facing to that of the waypoint
    float fWP = GetFacing(oWP);
    DelayCommand(1.1, AssignCommand(oPC, SetFacing(fWP)));
    DelayCommand(1.1, AssignCommand(oPC, SetCameraFacing(fWP, 10.0)));
}
