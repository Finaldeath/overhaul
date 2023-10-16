#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            object oDesk = GetNearestObjectByTag("PLAC_VARH_DESK", oPC);
            object oVarhun = GetNearestObjectByTag("CT_UNIQ_SH_VARH");

            if (GetDistanceBetween(oDesk, oVarhun) > 5.0)
            {
                AddJournalSingle("JT_PREL_KARA", 6, oPC);

                SetPlotFlag(oDesk, FALSE);

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }
    }
}
