#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();

    object o;

    o = GetNearestObjectByTag("DT_BH_ST_0_TAV_DOOR", oPC);

    AssignCommand(o, ActionCloseDoor(o));

    SetLocked(o, TRUE);

    o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "CT_COMM_BH_S0SP")
        {
            ChangeToStandardFaction(o, STANDARD_FACTION_HOSTILE);

            DelayCommand(1.5, SetPlotFlag(o, FALSE));

            AssignCommand(o, DetermineCombatRound());
        }

        o = GetNextObjectInArea();
    }
}
