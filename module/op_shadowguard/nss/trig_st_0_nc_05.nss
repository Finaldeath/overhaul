#include "help_general"
#include "help_hench"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);

        if (GetTag(oHench) == "HENCH_TARI")
        {
            RemoveHenchman(oPC, oHench);

            object oWP = GetNearestObjectByTag("WP_EXIT");

            AssignCommand(oHench, ActionMoveToObject(oWP));

            AddJournalSingle("JT_PREL_TARI", 18, oPC);
        }

        if (GetFirstTimeIn())
        {
            object oPH = GetNearestObjectByTag("CT_COMM_PH_DOORMAN", oPC);

            if (!(GetIsEnemy(oPC, oPH)))
            {
                string s;

                int nCheck = 0;

                int nInt = GetAbilityScore(oPC, ABILITY_INTELLIGENCE);

                int nWis = GetAbilityScore(oPC, ABILITY_WISDOM);

                if (nInt >= 13)
                {
                    s = "[Intelligence]";
                    nCheck = 1;
                }

                else if (nWis >= 15)
                {
                    s = "[Wisdom]";
                    nCheck = 1;
                }

                if (nCheck == 1)
                {
                    s += "  [It occurs to you that, since the Nightcrawler gang is awaiting someone to come for Tarin, you might be able to disguise yourself in one of their uniforms and convince this thug to let you pass...]";

                    SceneSpeak(oPC, s);

                    AddJournalSingle("JT_PREL_TARI", 13, oPC);
                }
            }
        }
    }
}
