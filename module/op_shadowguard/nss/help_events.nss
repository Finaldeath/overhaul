#include "help_general"

void Stage1CrimsonProphetArrival(object oPC)
{
    object oHark = OBJECT_SELF;
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    object oHench = GetHenchman(oPC);
    object oDoor, oWP;

    location lWP;
    float offset = 3.0f;

    effect eParalyze = EffectCutsceneParalyze();
    effect eVfx = EffectVisualEffect(VFX_DUR_PARALYZE_HOLD);

    AssignCommand(oHark, ActionMoveToObject(oPC, TRUE));
    AssignCommand(oPC, ClearAllActions(TRUE));

    oWP = GetNearestObjectByTag("WP_CT_HARKON_0", oPC);
    lWP = GetLocation(oWP);

    DelayCommand(0.8, AssignCommand(oPC, ActionMoveToLocation(lWP)));
    DelayCommand(1.0, SetCommandable(FALSE, oPC));
    SceneSpeak(oHark, "So you managed to lower the Control Stone's shields, " + GetName(oPC) + "...  Quite resourceful for one so young as you...  But you should flee this place quickly!  The Crimson Prophet remains near!");

    oDoor = GetNearestObjectByTag("DOOR_GHAA_IMP_TREASURY", oPC);

    DestroyObject(oDoor, offset);

    DelayCommand(offset, SceneSpeak(oPC, "[Suddenly, you notice the doors of the Imperial Treasury shatter, a red robed figure slowly emerging from within...]"));

    oWP = GetNearestObjectByTag("WP_EXPLOSION_POINT", oHark, 1);

    DelayCommand(offset, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL), GetLocation(oWP)));

    oWP = GetNearestObjectByTag("WP_EXPLOSION_POINT", oHark, 2);

    DelayCommand(offset, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL), GetLocation(oWP)));
    DelayCommand(offset, AssignCommand(oCP, ActionMoveToLocation(GetLocation(oPC), TRUE)));
    DelayCommand(offset, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL), GetLocation(oWP)));

    DelayCommand(offset + 2.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx, oHark));
    DelayCommand(offset + 2.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, oHark));
    DelayCommand(offset + 2.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx, oHench));
    DelayCommand(offset + 2.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, oHench));
    DelayCommand(offset + 3.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx, oPC));
    DelayCommand(offset + 3.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, oPC));
}
