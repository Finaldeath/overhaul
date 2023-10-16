#include "help_hench"

//HACK: Double-check to ensure that the assassins actually are still alive.
void main()
{
    object oXanthar = GetNearestObjectByTag("CT_UNIQ_NT_XANT");
    object oAssassin = GetNearestObjectByTag("CT_COMM_CH_ASSA");
    if (oXanthar == OBJECT_INVALID &&
        oAssassin == OBJECT_INVALID)
    {
        SetLocalInt(GetModule(), "N_ST_0_ASSA_DEAD", 3);
        AddJournalSingle("JT_ST_0_MAIN", 7, GetFirstPC());
    }
}
