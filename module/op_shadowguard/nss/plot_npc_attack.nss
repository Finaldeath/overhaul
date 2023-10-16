#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();

    DelayCommand(1.0, SetPlotFlag(OBJECT_SELF, FALSE));

    SetIsTemporaryEnemy(GetPCSpeaker());

    DetermineCombatRound();

    int i = 1;

    object o = GetNearestObject(OBJECT_TYPE_CREATURE);

    while (o != OBJECT_INVALID)
    {
        if (GetFactionEqual(o))
        {
            if (GetArea(o) == GetArea(OBJECT_SELF))
            {
                if (GetDistanceBetween(o, OBJECT_SELF) < 10.0)
                {
                    if (GetPlotFlag(o) == FALSE)
                    {
                        SetIsTemporaryEnemy(oPC, o);
                        AssignCommand(o, DetermineCombatRound());
                    }
                }
            }
        }

        i++;

        o = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, i);
    }

}
