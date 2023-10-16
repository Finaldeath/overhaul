//::///////////////////////////////////////////////
//:: Allies Fight
//:: 2Q4D_AlliesFight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Kurth's Troops and the Planar Creatures
    to fight.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 17, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nFight = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4D_INFIGHTING");
    if(nFight == 1)
    {
        object oKurth = GetObjectByTag("2Q4D_Kurth");
        object oRak = GetObjectByTag("2Q4D_RAKSHASA");

        AdjustReputation(oKurth, oRak, -100);
        AdjustReputation(oRak, oKurth, -100);
        AssignCommand(oRak, DetermineCombatRound(oKurth));
        AssignCommand(oKurth, DetermineCombatRound(oRak));
    }
}
