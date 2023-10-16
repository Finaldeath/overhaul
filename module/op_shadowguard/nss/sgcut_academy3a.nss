#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    object oJanthos = GetNearestObjectByTag("SGCUT_JANTHOS");
    object oAlia = GetNearestObjectByTag("SGCUT_ALIA");
    object oJarvis = GetNearestObjectByTag("CT_UNIQ_SH_INST", oPC);
    object oAliaDAD = GetNearestObjectByTag("ALIA_DAD");
    object oAliaMOM = GetNearestObjectByTag("ALIA_MOM");

    object wpPC = GetWaypointByTag("SGWP_CUTPC");
    object wpJanthos = GetWaypointByTag("SGWP_CUTJANTHOS");
    object wpAlia = GetWaypointByTag("SGWP_CUTALIA");
    object wpJarvis = GetWaypointByTag("SGWP_CUTJARVIS");

    object oWPExit = GetNearestObjectByTag("WP_EXIT");
    location lWPExit = GetLocation(oWPExit);

    SetCutsceneMode(oPC, TRUE);

    AddJournalSingle("JT_GRAD_CEREMONY", 4, oPC);

    AssignCommand(oPC, DelayCommand(0.7f, SetCameraFacing(290.0f, 7.0f, 70.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oJarvis, DelayCommand(1.0f, ActionMoveToObject(wpJarvis, FALSE, 0.0f)));
    AssignCommand(oPC, DelayCommand(1.2, ActionMoveToObject(wpPC, FALSE, 0.0f)));
    AssignCommand(oJanthos, DelayCommand(1.4f, ActionMoveToObject(wpJanthos, FALSE, 0.0f)));
    AssignCommand(oAlia, DelayCommand(1.6f, ActionMoveToObject(wpAlia, FALSE, 0.0f)));

    AssignCommand(oPC, DelayCommand(2.5f, SetFacing(90.0f)));
    AssignCommand(oJanthos, DelayCommand(2.6f, SetFacing(90.0f)));
    AssignCommand(oAlia, DelayCommand(2.7f, SetFacing(90.0f)));

    AssignCommand(oJarvis, DelayCommand(2.8f, SetFacing(270.0f)));

    DelayCommand(3.0f, AssignCommand(oJarvis, ActionStartConversation(oPC)));
}
