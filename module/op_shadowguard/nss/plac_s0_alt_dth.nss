#include "help_hench"

void main()
{
    int i = GetLocalInt(GetArea(OBJECT_SELF), "N_CONS_DEAD");

    i++;

    SetLocalInt(GetArea(OBJECT_SELF), "N_CONS_DEAD", i);

    if (i >= 4)
        AddJournalSingle("JT_GRAD_TEST", 10, GetFirstPC());

    object oLight = GetNearestObjectByTag("PT_ALTAR_LIGHT");

    DestroyObject(oLight);

    object o = GetLocalObject(OBJECT_SELF, "O_CONSTRUCT");

    SetImmortal(o, FALSE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), o);
}
