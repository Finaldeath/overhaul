
const string sAcadJarv1 = "Now the right of citizenship grows to a close.";
const string sAcadJarv2 = "Though you have all lived many years in this Empire.";
const string sAcadJarv3 = "You are now official citizens of Sharakha.";
const string sAcadJarv4 = "Congradulations to all of you!";

const string sAcaDAD = "Congradulations my little one.";
const string sAcaMOM = "I'm so proud of you!";

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

    AssignCommand(oPC, DelayCommand(0.7f, SetCameraFacing(275.0f, 8.0f, 70.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oJarvis, DelayCommand(1.0f, ActionMoveToObject(wpJarvis, FALSE, 0.0f)));
    AssignCommand(oPC, DelayCommand(1.2, ActionMoveToObject(wpPC, FALSE, 0.0f)));
    AssignCommand(oJanthos, DelayCommand(1.4f, ActionMoveToObject(wpJanthos, FALSE, 0.0f)));
    AssignCommand(oAlia, DelayCommand(1.6f, ActionMoveToObject(wpAlia, FALSE, 0.0f)));

    AssignCommand(oPC, DelayCommand(2.5f, SetFacing(90.0f)));
    AssignCommand(oJanthos, DelayCommand(2.6f, SetFacing(90.0f)));
    AssignCommand(oAlia, DelayCommand(2.7f, SetFacing(90.0f)));

    AssignCommand(oJarvis, DelayCommand(2.8f, SetFacing(270.0f)));

    AssignCommand(oAliaDAD, DelayCommand(3.2f, ClearAllActions(TRUE)));
    AssignCommand(oAliaMOM, DelayCommand(3.2f, ClearAllActions(TRUE)));

    AssignCommand(oJarvis, DelayCommand(3.9f, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 12.0f)));

    AssignCommand(oJarvis, DelayCommand(4.2f, SpeakString(sAcadJarv1)));
    AssignCommand(oJarvis, DelayCommand(8.2f, SpeakString(sAcadJarv2)));
    AssignCommand(oJarvis, DelayCommand(12.2f, SpeakString(sAcadJarv3)));


    AssignCommand(oJarvis, DelayCommand(16.9f, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3)));
    AssignCommand(oJarvis, DelayCommand(17.3f, SpeakString(sAcadJarv4)));

    AssignCommand(oAlia, DelayCommand(17.8f, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
    AssignCommand(oJanthos, DelayCommand(18.0f, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2)));

    AssignCommand(oJanthos, DelayCommand(18.0f, ActionMoveToLocation(lWPExit, FALSE)));
    DestroyObject(oJanthos, 20.0);

    AssignCommand(oPC, DelayCommand(20.7f, SetCameraFacing(350.0f, 8.0f, 80.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oAliaDAD, DelayCommand(19.7f, ActionMoveToObject(wpAlia)));
    AssignCommand(oAliaMOM, DelayCommand(21.2f, ActionMoveToObject(wpAlia)));

    AssignCommand(oAliaDAD, DelayCommand(23.3f, SpeakString(sAcaDAD)));
    AssignCommand(oAliaMOM, DelayCommand(25.3f, SpeakString(sAcaMOM)));
    AssignCommand(oAliaMOM, DelayCommand(25.6f, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0f, 3.0f)));

    AssignCommand(oAlia, DelayCommand(28.8f, ActionMoveToLocation(lWPExit, TRUE)));
    AssignCommand(oAliaDAD, DelayCommand(28.8f, ActionMoveToLocation(lWPExit, TRUE)));
    AssignCommand(oAliaMOM, DelayCommand(28.8f, ActionMoveToLocation(lWPExit, TRUE)));

    DestroyObject(oAlia, 30.0);
    DestroyObject(oAliaDAD, 30.0);
    DestroyObject(oAliaMOM, 30.0);

    DelayCommand(30.0f, SetCutsceneMode(oPC, FALSE));
}
