#include "help_general"

void DoGhostlyHue(object oDoor)
{
    effect eGhostlyHue = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhostlyHue, oDoor);
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oDoor;

            oDoor = GetNearestObjectByTag("DOOR_INT_1", OBJECT_SELF, 1);

            SetLocked(oDoor, TRUE);

            DoGhostlyHue(oDoor);

            SetPlotFlag(oDoor, TRUE);

            oDoor = GetNearestObjectByTag("DOOR_INT_1", OBJECT_SELF, 2);

            SetLocked(oDoor, TRUE);

            DoGhostlyHue(oDoor);

            SetPlotFlag(oDoor, TRUE);

        }
    }
}
