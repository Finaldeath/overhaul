#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_MARK", oPC) == 7)
        {
            if (GetFirstTimeIn())
            {
                object oDesk = GetNearestObjectByTag("PLAC_VARH_DESK", oPC);
                object oLetter = GetItemPossessedBy(oDesk, "IT_PLOT_011");
                DestroyObject(oLetter);

                CreateItemOnObject("IT_PLOT_018", oDesk);
            }
        }
    }

    else if (GetTag(oPC) == "CT_UNIQ_SH_VARH")
    {
        object oDesk = GetNearestObjectByTag("PLAC_VARH_DESK");
        SetPlotFlag(oDesk, FALSE);
        SetLocked(oDesk, FALSE);
    }
}
