#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    SetCutsceneMode(oPC, TRUE);
    AssignCommand(oPC, ClearAllActions(TRUE));
//    SpawnBeginningItems(oPC);
//    AssignCommand(oPC, ActionEquipMostEffectiveArmor());

    RemoveAllEffects(oPC);

    int n;

    n = VFX_FNF_SCREEN_SHAKE;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(n), oPC);

    n = VFX_FNF_SUMMON_CELESTIAL;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(n), oPC);

    object oWP = GetWaypointByTag("WP_ST_0_TRUE_BEGIN");
    location lWP = GetLocation(oWP);

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    DelayCommand(3.0, FadeToBlack(oPC, FADE_SPEED_FASTEST));
    DelayCommand(3.5, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(4.0, AssignCommand(oPC, JumpToLocation(lWP)));
    DelayCommand(4.5, SetCutsceneMode(oPC, FALSE));
}
