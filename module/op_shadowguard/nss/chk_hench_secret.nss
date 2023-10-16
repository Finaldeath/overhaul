#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHench = GetHenchman(oPC);

    string sTag = "";

    object o = GetNearestObjectByTag(sTag);

    if (GetTag(OBJECT_SELF) != "PLAC_ST_1_RAK_STAT")
        return FALSE;

    if (GetJournalQuestState("JT_ST_1_MAIN", GetPCSpeaker()) >= 6)
        return FALSE;

    if (GetDistanceBetween(oHench, OBJECT_SELF) > 10.0)
        return FALSE;

    if (GetTag(oHench) != "HENCH_LYEN")
        return FALSE;

    return TRUE;
}
