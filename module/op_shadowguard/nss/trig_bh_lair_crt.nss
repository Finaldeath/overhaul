#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oBH = GetNearestObjectByTag("CT_COMM_BH_S0SP", oPC);

        if (GetArea(oBH) == GetArea(oPC))
        {
            AddJournalSingle("JT_PREL_LYEN", 11, oPC);

            SceneSpeak(oBH, "You have arrived... Follow me down into our lair, and we shall finish our business. [The slavers open a trapdoor nearby, and descend into its depths...]");

            AssignCommand(oBH, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 10.0));

            DestroyObject(oBH, 4.5);

            oBH = GetNearestObjectByTag("CT_COMM_BH_S0SP", oPC, 2);

            AssignCommand(oBH, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 10.0));

            DestroyObject(oBH, 4.5);

            SetLocalInt(oPC, "N_CREATE_BH_LAIR_TP_DR", 1);

        }

        if (GetLocalInt(oPC, "N_CREATE_BH_LAIR_TP_DR") == 0)
        {
            object oHench = GetHenchman(oPC);

            if (GetTag(oHench) == "HENCH_LYEN" && GetJournalQuestState("JT_PREL_LYEN", oPC) == 10)
            {
                SceneSpeak(oHench, "[Lyen points towards a well hidden edge of a door jutting out from the ground to the north.]  Look, " + GetName(oPC) + "!  A trap door lies ahead in that rubble...  Perhaps it leads to the Bloodhawk's lair...");

                AddJournalSingle("JT_PREL_LYEN", 11, oPC);

                SetLocalInt(oPC, "N_CREATE_BH_LAIR_TP_DR", 1);
            }

            else if (GetIsSkillSuccessful(oPC, SKILL_SEARCH, 27))
            {
                SceneSpeak(oPC, "[You notice the edge of a trap door jutting out from the rubble to the north...  Perhaps this leads to the Bloodhawk's elusive base...]");

                AddJournalSingle("JT_PREL_LYEN", 11, oPC);

                SetLocalInt(oPC, "N_CREATE_BH_LAIR_TP_DR", 1);
            }
        }

        // IF BLOODHAWK TRAPDOOR NEEDS TO BE CREATED, DO SO
        if (GetLocalInt(oPC, "N_CREATE_BH_LAIR_TP_DR") == 1)
        {
            SendMessageToPC(oPC, "[SHOULD CREATE BLOODHAWK TRAPDOOR HERE...]");
        }
    }
}
