#include "help_general"

void main()
{
    object o = GetNearestObjectByTag("NW_NOBLMALE");

    AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 10.0));

    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o));
}
