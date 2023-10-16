#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oVhorkas = GetNearestObjectByTag("CT_UNIQ_SH_VHOR");

        SceneSpeak(oVhorkas, GetName(oPC) + ", please come speak with me.  I have an offer for you that I believe you will find quite interesting...");
    }
}
