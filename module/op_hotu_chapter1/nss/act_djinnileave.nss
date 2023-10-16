//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Djinni goes back to his bottle.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "inc_plot_locals"
void main()
{
    object oDjinni = GetObjectByTag("q2cdjinni");
    effect ePoof = EffectVisualEffect(VFX_DUR_BLUR);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,ePoof,oDjinni);
    DestroyObject(oDjinni,1.0);
}
