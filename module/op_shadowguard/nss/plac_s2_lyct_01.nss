#include "help_conv"
#include "help_general"

void main()
{
    if (GetSelfTalkLevelInt(OBJECT_SELF) < 2)
    {
        if (GetDamageDealtByType(DAMAGE_TYPE_ELECTRICAL) > 0)
        {
            object oPC = GetLastDamager();

            if (GetLocalInt(oPC, "N_THREW_BY_PC") == 1 || GetIsPC(GetMaster(oPC)))
            {
                oPC = GetFirstPC();
            }

            if (GetLocalInt(OBJECT_SELF, "N_COMBINATION") != 394)
            {
                SceneSpeak(oPC, "[As the electric voltage passes through the contraption, it quickly rages wildly out of control, and arcs of energy begin spouting out of it...]");

                object o = GetNearestObject(OBJECT_TYPE_CREATURE);

                int i = 1;

                int nMiss = FALSE;

                while (GetDistanceBetween(OBJECT_SELF, o) < 10.0)
                {
                    if (ReflexSave(o, 14) == 0)
                    {
                        SceneSpeak(o, "[Reflex Save Failure]  [A beam of electricity hits " + GetName(o) + " squarely in the chest...]");

                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(3) + 2, DAMAGE_TYPE_ELECTRICAL), o);

                        nMiss = FALSE;
                    }

                    else
                    {
                        SceneSpeak(o, "[Reflex Save Success]  [" + GetName(o) + " quickly steps aside as an electrical bolt arcs out of the machines, avoiding a potentially dangerous shock...]");

                        nMiss = TRUE;

                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST, nMiss), o, 3.0);
                    }

                    i++;

                    o = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, i);
                }
            }

            else
            {
                if (GetDamageDealtByType(DAMAGE_TYPE_ELECTRICAL) >= 5)
                {
                    SceneSpeak(oPC, "[The Gnomish contraption begins humming loudly, and it appears to now be active...]");

                    string sTag = GetTag(OBJECT_SELF);

                    SetSelfTalkLevelInt(OBJECT_SELF, 2);
                }

                else
                    SceneSpeak(oPC, "[For a moment, it seems the contraption will hum into life, but then it quiets once more...  Perhaps a bit more electricity is needed...");
            }
        }
    }
}
