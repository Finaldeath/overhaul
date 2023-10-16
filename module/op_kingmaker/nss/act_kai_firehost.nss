//::///////////////////////////////////////////////
//:: act_kai_firehost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The monster attacks
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    object oMonst = GetObjectByTag("q1_firemonster");
    SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",60);
    ChangeToStandardFaction(oMonst,STANDARD_FACTION_HOSTILE);
    DetermineCombatRound(oMonst);
}
