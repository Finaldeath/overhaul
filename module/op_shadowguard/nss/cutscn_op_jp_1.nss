//Move to Stage 1 of the opening cutscene.

void main()
{
    //Define the current cutscene stage
    int iStage = 1;

    //Update their cutscene stage.
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iOpeningCutscene", iStage);

    //Fire the conversation
    DelayCommand(0.5, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", TRUE, FALSE)));

    //Reset their facing to that of the waypoint
    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_"+IntToString(iStage), oPC);
    float fWP = GetFacing(oWP);
    DelayCommand(0.6, AssignCommand(oPC, SetFacing(fWP)));
    DelayCommand(0.6, AssignCommand(oPC, SetCameraFacing(fWP, 10.0)));
}
