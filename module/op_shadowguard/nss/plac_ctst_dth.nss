#include "help_general"
#include "help_effects"
#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    object oSafty;

    AddJournalSingle("JT_ST_1_MAIN", 6, oPC);

    SetLocalInt(GetModule(), "N_ST_1_HARK_FREED", 1);

    effect e;

    e = EffectVisualEffect(VFX_FNF_IMPLOSION);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, GetLocation(OBJECT_SELF));
    e = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, GetLocation(OBJECT_SELF));

    AssignCommand(oPC, ClearAllActions(TRUE));
    if (GetDistanceBetween(oPC, OBJECT_SELF) > 10.0f)
    {
        oSafty = GetNearestObjectByTag("WP_CUTPLAYERSAFE", oPC);
        AssignCommand(oPC, JumpToLocation(GetLocation(oSafty)));
    }

    object oLight = GetNearestObjectByTag("PLAC_LIGHT");

    SetPlotFlag(oLight, FALSE);
    DestroyObject(oLight);

    SceneSpeak(GetFirstPC(), "[As the Control Stone of Ghaarak implodes upon itself, the chamber begins to shake, and you sense the stone's power quickly dispersing...]");
}
