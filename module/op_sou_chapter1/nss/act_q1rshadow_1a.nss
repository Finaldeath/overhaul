#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    DestroyObject(OBJECT_SELF, 4.0);
    ActionMoveAwayFromObject(oPC, TRUE);
    SetCommandable(FALSE);
            //Blink stag will teleport away
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_MIND), GetLocation(OBJECT_SELF)));

    DestroyObject(OBJECT_SELF, 1.5);

    RewardXP("xplow", 100, GetPCSpeaker());
    AdjustAlignment(GetPCSpeaker(),ALIGNMENT_GOOD, 2);
}
