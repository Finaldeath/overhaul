//::///////////////////////////////////////////////
//:: Name act_q2dformqn_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has angered the formians - they will attack
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    //Set the Formians to Hostile faction
        object oArea = GetArea(OBJECT_SELF);
        object oFormian = GetFirstObjectInArea(oArea);

        while (oFormian != OBJECT_INVALID)
        {
            if (GetStringLeft(GetTag(oFormian), 11) == "q2d_cutform")
            {
                ChangeToStandardFaction(oFormian, STANDARD_FACTION_HOSTILE);
                DelayCommand(1.0, AssignCommand(oFormian, DetermineCombatRound()));
            }
            oFormian = GetNextObjectInArea(oArea);
        }
        ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0, DetermineCombatRound());
}
