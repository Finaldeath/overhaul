//::///////////////////////////////////////////////
//:: Name q2a_death_batpst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnDeath script for theDrow Field Commander
    HEr death causes the drow to retreat..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") != 1)
    {
        //SendMessageToPC(GetFirstPC(), "PC VICTORY in BATTLE 1 - General Killed");
        //object oBattleMaster = GetObjectByTag("bat1_battlemaster");
        //SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_RETREAT));
    }
    //ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
