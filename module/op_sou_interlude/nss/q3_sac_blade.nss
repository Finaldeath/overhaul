// Blade given by the mummy to kill Ali

#include "x1_inc_plot"

void main()
{
    object oPC = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    object Item = GetItemActivated();

    if(GetTag(oTarget) == "Q2A_ALI")
    {
        SetPlot("Q2_JOURNAL_ROD", 30, GetFirstPC());
        SetPlot("Q2_JOURNAL_WATER", 50, GetFirstPC());
        effect eDeath = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);

    }
}
