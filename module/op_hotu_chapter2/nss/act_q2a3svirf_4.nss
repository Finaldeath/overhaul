//Svirf collapses

#include "nw_i0_plot"
void main()
{
    //Reward Good PCs with minor XP
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    if (GetLocalInt(oArea, "nSvirfQuestDone") == 1)
        return;

    SetLocalInt(oArea, "nSvirfQuestDone", 1);
    if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
        Reward_2daXP(oPC, XP_MEDIUM_LOW, FALSE);


    object oSvirf = GetObjectByTag("q2a3svirf");
    SetPlotFlag(oSvirf, FALSE);

    effect eKnockdown = EffectKnockdown();
    effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eKnockdown, oSvirf);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, oSvirf);
    DelayCommand(0.5, SetCommandable(FALSE, oSvirf));

}
