const string sAcadJarv1 = "Alright now, line up!";
const string sAcadJarv2 = "It's now time to begin the ceremony.";

void main()
{
    object oPC = GetFirstPC();
    object oJanthos = GetNearestObjectByTag("SGCUT_JANTHOS");
    object oAlia = GetNearestObjectByTag("SGCUT_ALIA");
    object oJarvis = GetNearestObjectByTag("CT_UNIQ_SH_INST");

    object wpPC = GetWaypointByTag("SGWP_CUTPC");
    object wpJanthos = GetWaypointByTag("SGWP_CUTJANTHOS");
    object wpAlia = GetWaypointByTag("SGWP_CUTALIA");
    object wpJarvis = GetWaypointByTag("SGWP_CUTJARVIS");

    object oItemLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    object oItemRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

    AssignCommand(oPC, DelayCommand(0.7f, SetCameraFacing(275.0f, 11.0f, 70.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oJarvis, DelayCommand(1.2f, ActionMoveToObject(wpJarvis, FALSE, 0.0f)));
    AssignCommand(oJarvis, DelayCommand(3.2f, SetFacing(270.0f)));

    AssignCommand(oJarvis, DelayCommand(3.9f, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING)));
    AssignCommand(oJarvis, DelayCommand(4.3f, SpeakString(sAcadJarv1)));

    AssignCommand(oPC, DelayCommand(5.0, ActionMoveToObject(wpPC, FALSE, 0.0f)));
    AssignCommand(oJanthos, DelayCommand(5.2f, ActionMoveToObject(wpJanthos, FALSE, 0.0f)));
    AssignCommand(oAlia, DelayCommand(5.6f, ActionMoveToObject(wpAlia, FALSE, 0.0f)));

    AssignCommand(oPC, DelayCommand(6.3f, SetFacing(90.0f)));
    AssignCommand(oPC, DelayCommand(6.9f, ActionUnequipItem(oItemLeft)));
    AssignCommand(oPC, DelayCommand(7.5f, ActionUnequipItem(oItemRight)));

    AssignCommand(oJanthos, DelayCommand(8.3f, SetFacing(90.0f)));
    AssignCommand(oAlia, DelayCommand(8.6f, SetFacing(90.0f)));

    AssignCommand(oJarvis, DelayCommand(8.2f, SpeakString(sAcadJarv2)));
    AssignCommand(oPC, DelayCommand(8.3f, SetCameraFacing(290.0f, 8.0f, 75.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oPC, DelayCommand(9.4f, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
    AssignCommand(oAlia, DelayCommand(9.4f, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
    AssignCommand(oJanthos, DelayCommand(9.4f, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE)));

    AssignCommand(oJarvis, DelayCommand(11.2f, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
    AssignCommand(oJarvis, DelayCommand(12.6f, ActionStartConversation(oPC)));
}
