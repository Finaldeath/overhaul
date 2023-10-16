#include "help_hench"

void main()
{
    //Remove effects
    object oPC = GetPCSpeaker();
    effect e = GetFirstEffect(oPC);
    while (GetIsEffectValid(e) == TRUE)
    {
        RemoveEffect(oPC, e);
         e = GetNextEffect(oPC);
    }

    //End the cutscene
    SetCutsceneMode(oPC, FALSE);

    //Update the Journal system
    AddJournalSingle("JT_GRAD_TEST", 1, oPC);

    // CAUSE THE SG'S TO MOVE TO APPROPRIATE SPOTS
    string s;
    object oHench;
    object oWP;

    s = "HENCH_MARK";
    oHench = GetNearestObjectByTag(s);
    AssignCommand(oHench, SetFacing(90.0));

    s = "HENCH_KARA";
    oHench = GetNearestObjectByTag(s);
    oWP = GetNearestObjectByTag("WP_SG_TR_" + s);
    AssignCommand(oHench, ActionForceMoveToObject(oWP, TRUE, 1.0, 3.0));

    s = "HENCH_LYEN";
    oHench = GetNearestObjectByTag(s);
    oWP = GetNearestObjectByTag("WP_SG_TR_" + s);
    AssignCommand(oHench, ActionForceMoveToObject(oWP, TRUE, 1.0, 3.0));
}
