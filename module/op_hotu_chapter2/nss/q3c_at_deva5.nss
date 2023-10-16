// Deva teleports away

#include "x2c2_inc_plot"

void main()
{
    effect eVis = EffectVisualEffect(472);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    DelayCommand(1.0, DestroyObject(OBJECT_SELF));
    SetPlot("q3_deva", 98);
}
