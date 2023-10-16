#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetFirstPC();
    object oHench = GetHenchman(oPC);

    int iFlag = GetLocalInt(oPC, "FNL_HNCH_DOONCE");

    if (iFlag != TRUE)
    {
        SetLocalInt(oPC, "FNL_HNCH_DOONCE", TRUE);

        RemoveHenchman(oPC, oHench);
        AssignCommand(oHench, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oHench)));
        SetLocalInt(oHench, "N_DONT_SPEAK", 1);
    }
}
