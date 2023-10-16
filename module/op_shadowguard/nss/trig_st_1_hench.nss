#include "help_hench"
#include "help_general"

void HammerHostiles(object oArea);

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_1_MAIN", oPC) >= 6)
        {
            if (GetFirstTimeIn())
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                object oHench = GetHenchman(oPC);
                AssignCommand(oHench, ClearAllActions(TRUE));

                AssignCommand(oHench, ActionJumpToObject(oPC));
                AssignCommand(oHench, ActionStartConversation(oPC, "hench_protect2"));

                SpawnHenchman(oPC, "HENCH_MARK");
                //SpawnHenchman(oPC, "HENCH_LYEN");

                SpawnHenchman(oPC, "HENCH_KARA");

                if ((GetJournalQuestState("JT_PREL_TARI", oPC) != 15)
                && (GetJournalQuestState("JT_PREL_TARI", oPC) != 16))
                {
                    SpawnHenchman(oPC, "HENCH_TARI");
                }

                if (GetJournalQuestState("JT_PREL_TARI", oPC) != 16)
                {
                    SpawnHenchman(oPC, "HENCH_BRUK");
                }

                string s = "CT_HARKON_0";
                object oWP = GetNearestObjectByTag("WP_" + s, oPC);

                location lWP = GetLocation(oWP);
                s = s + IntToString(GetLocalInt(GetModule(), "N_OKARIS_RACE"));
                object oHark = CreateObject(OBJECT_TYPE_CREATURE, s, lWP);

                SetLocalInt(OBJECT_SELF, "N_DO_HARK_CREATE", 1);

                HammerHostiles(GetArea(oPC));
            }
        }
    }
}

//Brute force fix to prevent the Henchmen being lured away and
//breaking due to ambient hostiles in the area.
void HammerHostiles(object oArea)
{
    effect eDeath = EffectDeath(FALSE, FALSE);
    object oPC = GetFirstPC();
    object oHostile = GetFirstObjectInArea(oArea);

    while (GetIsObjectValid(oHostile) == TRUE)
    {
        if ((GetObjectType(oHostile) == OBJECT_TYPE_CREATURE)
        && (GetIsReactionTypeHostile(oPC, oHostile) == TRUE))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, oHostile);
        }

        oHostile = GetNextObjectInArea(oArea);
    }
}
