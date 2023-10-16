#include "help_hench"

void main()
{
    object o;

    o = GetNearestObjectByTag("PLAC_INVISIBLE");

    SetPlotFlag(o, FALSE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);

    o = GetNearestObjectByTag("PLAC_LIGHT");

    SetPlotFlag(o, FALSE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);

    object oPC = GetFirstPC();

    int n = GetLocalInt(oPC, "N_ST_0_TRAINING_ALTS");

    n++;

    SetLocalInt(oPC, "N_ST_0_TRAINING_ALTS", n);

    if (n == 1)
        AddJournalSingle("JT_GRAD_TEST", 11, oPC);

    if (n == 2)
        AddJournalSingle("JT_GRAD_TEST", 12, oPC);
}
