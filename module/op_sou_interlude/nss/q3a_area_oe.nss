// flag player as entered the camp: needed to determine starting location

#include "x1_inc_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) // good for DMs also
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    // some area specific things:
    object oWorker = GetObjectByTag("Q3A_WORKER");
    effect eDamage = EffectDamage(6);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oWorker);
    SetPlot("Q5_JOURNAL_WAY", 100, oPC);
}
