#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    //Fade to Black
    BlackScreen(oPC);

    //Remove their effects to make them visible again.
    DelayCommand(1.0, RemoveAllEffects(oPC));

    //Skip the Sepulcher and jump directly to the Graduation Ceremony
    //object oWP = GetWaypointByTag("WP_ST_0_LAB_JUMP");
    object oWP = GetWaypointByTag("WP_ST_0_TRUE_BEGIN");
    location lWP = GetLocation(oWP);
    DelayCommand(1.1, AssignCommand(oPC, JumpToLocation(lWP)));

    //Have the player launch the cutscene conversation with themselves.
    //DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_sg_train", TRUE, FALSE)));
    DelayCommand(2.5, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_academy", TRUE, FALSE)));

    //Reset their facing to that of the waypoint.
    float fWP = GetFacingFromLocation(lWP);
    DelayCommand(2.6, AssignCommand(oPC, SetFacing(fWP)));
    DelayCommand(2.6, AssignCommand(oPC, SetCameraFacing(fWP, 10.0)));
}
