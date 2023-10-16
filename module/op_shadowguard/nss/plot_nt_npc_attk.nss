#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();

    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);

    AssignCommand(OBJECT_SELF, ActionEquipMostDamagingMelee(oPC));

    if (GetHasFeat(FEAT_AMBIDEXTERITY) || GetHasFeat(FEAT_TWO_WEAPON_FIGHTING))
        AssignCommand(OBJECT_SELF, ActionEquipMostDamagingMelee(oPC, TRUE));

    DelayCommand(1.0, SetPlotFlag(OBJECT_SELF, FALSE));

    DelayCommand(1.0, AssignCommand(OBJECT_SELF, DetermineCombatRound(oPC)));

    object oHenchMarker = GetObjectByTag("HENCH_MARK");

    object o = GetFirstFactionMember(oHenchMarker, FALSE);

    while (o != OBJECT_INVALID)
    {
        if (GetArea(o) == GetArea(OBJECT_SELF))
        {
            if (GetObjectSeen(OBJECT_SELF, o))
                AssignCommand(o, DetermineCombatRound());
        }

        o = GetNextFactionMember(oHenchMarker, FALSE);
    }
}
