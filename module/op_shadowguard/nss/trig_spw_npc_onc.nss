#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            string sTag = GetTag(OBJECT_SELF);

            int nLength = GetStringLength(sTag);

            sTag = GetSubString(sTag, 14, nLength - 14);

            if (GetLocalInt(GetModule(), "N_TEST") == 1)
                SendMessageToPC(oPC, "[Should be creating creature : " + sTag + " on nearest waypoint...]");

            CreateCreatureOnWP(sTag, oPC);

        }
    }
}
