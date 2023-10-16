#include "help_hench"

void main()
{
    int i = 1;

    object oPC = GetPCSpeaker();

    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_" + IntToString(i), oPC);

    location lWP = GetLocation(oWP);

    //Do a fade to hide the jump
//    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(0.5, AssignCommand(oPC, JumpToLocation(lWP)));
//    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    DelayCommand(0.8, AssignCommand(oPC, SetCameraFacing(GetFacing(oWP), 10.0)));

    i = GetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"));

    i++;

    SetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"), i);
}
