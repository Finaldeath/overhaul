
const string sAcadJarv1 = "This rite of passage now draws to a close.";
const string sAcadJarv2 = "Though you have all grown up as subjects of the Empire...";
const string sAcadJarv3 = "only now have you become its official citizens.";
const string sAcadJarv4 = "My congratulations to all of you!";

const string sAcadJant1 = "Well... I suppose I should return to my work on the golems.";

const string sAcaDAD = "Congratulations, my little one.";
const string sAcaMOM = "I'm so proud of you!";
const string aAcadAlia1 = "Thanks, mom and dad! Come, let's find you two an inn.";

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

    object wpDad = GetWaypointByTag("SGWP_DADWAY");
    object wpMom = GetWaypointByTag("SGWP_MOMWAY");

    object oWPExit = GetNearestObjectByTag("WP_EXIT");
    location lWPExit = GetLocation(oWPExit);

    AssignCommand(oPC, DelayCommand(0.2f, SetCameraFacing(300.0f, 7.5f, 75.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oAliaDAD, DelayCommand(0.2f, ClearAllActions(TRUE)));
    AssignCommand(oAliaMOM, DelayCommand(0.2f, ClearAllActions(TRUE)));

    AssignCommand(oJarvis, DelayCommand(1.0f, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 10.0f)));

    AssignCommand(oJarvis, DelayCommand(1.2f, SpeakString(sAcadJarv1)));
    AssignCommand(oJarvis, DelayCommand(4.2f, SpeakString(sAcadJarv2)));
    AssignCommand(oJarvis, DelayCommand(8.2f, SpeakString(sAcadJarv3)));

    AssignCommand(oJarvis, DelayCommand(11.9f, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
    AssignCommand(oJarvis, DelayCommand(12.3f, SpeakString(sAcadJarv4)));

    AssignCommand(oAlia, DelayCommand(12.4f, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
    AssignCommand(oPC, DelayCommand(12.5f, SetCameraFacing(350.0f, 8.0f, 80.0f,
        CAMERA_TRANSITION_TYPE_SLOW)));

    AssignCommand(oJanthos, DelayCommand(13.0f, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD)));
    AssignCommand(oJanthos, DelayCommand(14.2f, SpeakString(sAcadJant1)));

    AssignCommand(oPC, DelayCommand(15.0f, SetFacing(345.0f)));

    AssignCommand(oJanthos, DelayCommand(17.0f, ActionMoveToLocation(lWPExit, FALSE)));
    DestroyObject(oJanthos, 20.0);

    AssignCommand(oAliaDAD, DelayCommand(16.2f, ActionMoveToObject(wpDad)));
    AssignCommand(oAliaMOM, DelayCommand(17.7f, ActionMoveToObject(wpMom)));

    AssignCommand(oAlia, DelayCommand(18.0f,
        SetFacingPoint(GetPosition(oAliaDAD))));

    AssignCommand(oAliaDAD, DelayCommand(18.5f, SetFacingPoint(GetPosition(oAlia))));
    AssignCommand(oAliaDAD, DelayCommand(18.9f, SpeakString(sAcaDAD)));

    AssignCommand(oAliaMOM, DelayCommand(19.0f, SetFacingPoint(GetPosition(oAlia))));
    AssignCommand(oAliaMOM, DelayCommand(19.6f, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0f, 3.0f)));
    AssignCommand(oAliaMOM, DelayCommand(20.8f, SpeakString(sAcaMOM)));

    AssignCommand(oAlia, DelayCommand(24.0f, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
    AssignCommand(oAlia, DelayCommand(24.8f, SpeakString(aAcadAlia1)));

    AssignCommand(oAlia, DelayCommand(27.8f, ActionMoveToLocation(lWPExit)));
    AssignCommand(oAliaMOM, DelayCommand(28.2f, ActionMoveToLocation(lWPExit)));
    AssignCommand(oAliaDAD, DelayCommand(29.6f, ActionMoveToLocation(lWPExit)));

    DestroyObject(oAlia, 33.0);
    DestroyObject(oAliaDAD, 33.0);
    DestroyObject(oAliaMOM, 33.0);

    DelayCommand(30.0, AssignCommand(oJarvis, ActionStartConversation(oPC)));
}
