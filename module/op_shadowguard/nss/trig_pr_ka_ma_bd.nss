#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_KARA", oPC) >= 6)
        {
            if (GetLocalInt(OBJECT_SELF, "N_BODY_FOUND") == 0)
            {
                string sSpeak = "";

                if (GetSkillRank(SKILL_SPOT, oPC) >= 5)
                {
                    sSpeak += "[Spot] ";

                    SetLocalInt(oPC, "N_SPAWN_PREL_KARA_BODY", 1);
                }

                else if (GetSkillRank(SKILL_SEARCH, oPC) >= 5)
                {
                    sSpeak += "[Search] ";

                    SetLocalInt(oPC, "N_SPAWN_PREL_KARA_BODY", 1);
                }

                if (GetLocalInt(oPC, "N_SPAWN_PREL_KARA_BODY") == 1)
                {
                    string sTag = "PLAC_MALG_RUBB";

                    object oWP = GetNearestObjectByTag("WP_" + sTag, oPC);

                    location lWP = GetLocation(oWP);

                    CreateObject(OBJECT_TYPE_PLACEABLE, sTag, lWP);

                    SceneSpeak(oPC, sSpeak + "[You notice a rather suspicious pile of rubble lying near the sludgy pool of sewage ahead...]");

                    SetLocalInt(OBJECT_SELF, "N_BODY_FOUND", 1);
                }
            }
        }
    }
}
