// Ceremony cutscene: Strike the woman with a visual effect

#include "x2c2_inc_plot"

void main()
{
    SetLocalInt(GetModule(), "Q3_GONG_REMAINED_SILENT", 1);
    object oSac = GetNearestObjectByTag("q3a_sacrifice");
    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oSac);
    DelayCommand(0.5, AssignCommand(oSac, PlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK)));
    DelayCommand(1.5, AssignCommand(oSac, PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 0.8, 3.0)));
    SetPlot("q3_dracolich", 40);
}
