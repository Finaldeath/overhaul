//::///////////////////////////////////////////////
//:: Kobolds turn hostile
//:: act_sni_hostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Kobolds all hate the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "q_include"
void main()
{
    object oPC = GetFirstPC();
    //turn all kobolds hostile and attack pc
//  loop through all the tags in the area and change the faction to hostile
// and do a determinecombatround for each one
    q3_KoboldHostile();
    DetermineCombatRound(oPC);
}
