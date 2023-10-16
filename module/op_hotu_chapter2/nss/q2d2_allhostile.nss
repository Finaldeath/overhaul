//::///////////////////////////////////////////////
//:: Name: q2d2_allhostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All Mindflayers, Hulks and non-freed slaves
    go hostile to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
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
            }//check slaves
            else if (GetStringLeft(GetTag(oCreature), 7) == "q2dthra")
            {

                // if not freed - they help the mindflayers
                if (GetLocalInt(oCreature, "nFreed") == 0)
                {
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                }
                //if they are freed, they help the PC
                else
                {
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_COMMONER);

                }
                AssignCommand(oCreature, DetermineCombatRound());
            }
        }
        oCreature = GetNextObjectInArea();
    }
}
