//::///////////////////////////////////////////////
//:: M3Q4_ETTIN_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the nearest Hill Giant to hostile if you kill the Ettin.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 27, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1007)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        object oGiant = GetNearestObjectByTag("M3Q4_D16HillGiant");
        AdjustReputation(oPC,oGiant,-100);
//        DetermineCombatRound(oPC);
    }

}
