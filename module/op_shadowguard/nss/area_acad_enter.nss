#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE)
    {
        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            if (GetFirstTimeIn())
            {
                TestMessage("Firing OnEnter script for Imperial Academy...");

                RemoveAllEffects(oPC);

                int nHP = GetMaxHitPoints(oPC);

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHP), oPC);

                // TEMPORARILY REMOVED FOR TESTING PURPOSES
                // FadeToBlack(oPC, FADE_SPEED_FASTEST);
                //object oDeer = GetNearestObjectByTag("CT_UNIQ_NT_S0DR", oPC);
                //DoAnimationPermanent(oDeer, ANIMATION_LOOPING_DEAD_FRONT, FALSE);
            }
        } // END STAGE 0

        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetJournalQuestState("JT_ST_1_MAIN", oPC) < 6)
            {
                if (GetFirstTimeIn())
                {
                    object oWP = GetNearestObjectByTag("WP_HR_HENCH_LYEN_1_1", oPC);
                    location lWP = GetLocation(oWP);

                    // Lyen ist cut, Brukus replaces Lyen as Lyen :)
                    //CreateHenchman(oPC, "HENCH_LYEN", lWP);
                }
            }

            else
            {
                object o = GetFirstObjectInArea();

                while (o != OBJECT_INVALID)
                {
                    if (GetObjectType(o) == OBJECT_TYPE_CREATURE && GetHenchman(oPC) != o)
                        DestroyObject(o);

                    o = GetNextObjectInArea();
                }
            }
        } // END STAGE 1
    }
}
