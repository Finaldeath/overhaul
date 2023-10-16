#include "help_general"

void main()
{
    object oPC = GetFirstPC();

    if (GetLocked(OBJECT_SELF))
    {
        int nLocks = 5 - GetLocalInt(OBJECT_SELF, "N_LOCKS");

        SceneSpeak(oPC, "The heavy doors of the Grand Hall are well reinforced, and guarded by " + IntToString(nLocks) + " locks.]");

        object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG", oPC);

        SceneSpeak(oAnag, GetName(oPC) + ", you must find a way through those doors!");
    }
}
