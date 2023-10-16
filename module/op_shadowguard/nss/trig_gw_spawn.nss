#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            int i = GetLocalInt(oPC, "N_GW_HENCH_CHOICE");

            string sTag;

            if (i == 1)
                sTag = "CT_UNIQ_GW_SAVA";

            else if (i == 2)
                sTag = "CT_UNIQ_GW_DEFE";

            else if (i == 3)
                sTag = "CT_UNIQ_GW_HEAL";

            object oWP = GetNearestObjectByTag("WP_GW_HENCH_SPAWN", oPC);

            location lWP = GetLocation(oWP);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), lWP);

            object o = CreateObject(OBJECT_TYPE_CREATURE, sTag, lWP);

            AddHenchman(oPC, o);
        }
    }
}
