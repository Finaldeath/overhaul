#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_1_MAIN", oPC) > 15)
        {
            if (GetFirstTimeIn())
            {
                SetEncounterActive(TRUE);

                SceneSpeak(oPC, "[Suddenly, the doors to the gate explode, and several Crimson Followers emerge...  It appears they have already made their way into the Docks, and time is drawing short to escape Ghaarak...]");

                object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

                object oWP;
                location lWP;

                int i = 1;

                do
                {
                    oWP = GetNearestObjectByTag("WP_FlameLarge", oDoor, i);
                    lWP = GetLocation(oWP);

                    CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_LRG_FLAME", lWP);

                    i++;
                } while (oWP != OBJECT_INVALID);

                SetPlotFlag(oDoor, FALSE);

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), oDoor);

                DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oDoor));
            }
        }
    }
}
