// Explores area for player
#include "help_hench"
#include "help_general"

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            if (GetFirstTimeIn())
            {
                SetWeather(OBJECT_SELF, WEATHER_CLEAR);

                AmbientSoundSetDayVolume(OBJECT_SELF, 0);

                AmbientSoundSetNightVolume(OBJECT_SELF, 0);

                AmbientSoundStop(OBJECT_SELF);

                SceneSpeak(GetHenchman(oPC), "Come, " + GetName(oPC) + "...  Let us make our way to the Imperial fortress quickly...");
            }

            if (GetJournalQuestState("JT_ST_2_MAIN", oPC) >= 5)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_JT_5_ONCE") == 0)
                {
                    SpawnAllHenchmen(oPC);

                    object o = GetFirstObjectInArea();

                    while (o != OBJECT_INVALID)
                    {
                        if (GetObjectType(o) == OBJECT_TYPE_DOOR)
                        {
                            if (GetStringLeft(GetTag(o), 4) == "DOOR")
                            {
                                SetLocked(o, FALSE);
                            }
                        }

                        o = GetNextObjectInArea();
                    }

                    SetLocalInt(OBJECT_SELF, "N_DO_JT_5_ONCE", 1);
                }
            }
        }

        else
        {
            SetWeather(OBJECT_SELF, WEATHER_CLEAR);

            AmbientSoundSetDayVolume(OBJECT_SELF, 0);

            AmbientSoundSetNightVolume(OBJECT_SELF, 0);

            AmbientSoundStop(OBJECT_SELF);
        }
    }
}
