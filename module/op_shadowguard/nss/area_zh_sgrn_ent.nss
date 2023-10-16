#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        // STAGE 2
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            if (GetJournalQuestState("JT_ST_2_MAIN", oPC) >= 6)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_ST_2_6_ONCE") == 0)
                {
                    ExploreAreaForPlayer(OBJECT_SELF, oPC);

                    SpawnAllHenchmen(oPC);

                    SpawnCreatureByRace("CT_VERONA", oPC);

                    object o = GetFirstObjectInArea();

                    while (o != OBJECT_INVALID)
                    {
                        if (GetObjectType(o) == OBJECT_TYPE_DOOR)
                        {
                            SetLocked(o, FALSE);

                            AssignCommand(o, ActionOpenDoor(o));
                        }

                        else if (GetObjectType(o) == OBJECT_TYPE_CREATURE)
                        {
                            SitInNearestChair(o);
                        }

                        o = GetNextObjectInArea();
                    }

                    SetLocalInt(OBJECT_SELF, "N_DO_ST_2_6_ONCE", 1);
                }
            }
        } // END STAGE 2
    }
}
