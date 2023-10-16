#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object o;

            o = GetNearestObjectByTag("HENCH_MARK", oPC);

            AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 10.0));

            AssignCommand(o, DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o)));
        }
    }
}
