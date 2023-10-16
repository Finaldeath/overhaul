//::///////////////////////////////////////////////
//:: Name act_q2dslaveld_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave Leader and slaves go hostile to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{

    string szTag;
    object oThrall = GetFirstObjectInArea();
    while (oThrall != OBJECT_INVALID)
    {
        if (GetObjectType(oThrall) == OBJECT_TYPE_CREATURE)
        {
            szTag = GetStringLeft(GetTag(oThrall), 7);
            if (szTag == "q2dthra")
            {

                ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
                AssignCommand(oThrall, DetermineCombatRound());
            }

        }
        oThrall = GetNextObjectInArea();
    }
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound();
}
