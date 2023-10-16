#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oVarh = GetNearestObjectByTag("CT_UNIQ_SH_VARH", oPC);

            if (GetArea(oPC) == GetArea(oVarh))
            {
                string s = "[You see the body of Chancellor Varhun lying upon the floor, multiple stab wounds across his back...";

                if (GetJournalQuestState("JT_PREL_MARK", oPC) >= 5)
                    SceneSpeak(oPC, s + "  You cannot help but wonder if he has had some hand in all of this, but it seems you will never know now...]");

                else
                    SceneSpeak(oPC, s + "]");
            }
        }
    }
}
