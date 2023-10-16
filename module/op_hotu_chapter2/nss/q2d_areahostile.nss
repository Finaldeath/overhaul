//::///////////////////////////////////////////////
//:: Name q2d_areahostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All non-slaves in this area go hostile to the PC

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oCreature = GetFirstObjectInArea();
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {

            //Set them to hostile
            if (GetStringLeft(GetTag(oCreature), 7) == "q2d_ill")
            {
                ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                AssignCommand(oCreature, DetermineCombatRound());
            }
        }
        oCreature = GetNextObjectInArea();
    }
}
