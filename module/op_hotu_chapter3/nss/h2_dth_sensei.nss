//::///////////////////////////////////////////////
//:: Sensei Dharvana (OnDeath)
//:: H2_Dth_Aribeth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fire the OnDeath UD event to handle journal
     entries
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////

void main()
{
    //Signal User-Defined Death Event
    //SignalEvent(OBJECT_SELF, EventUserDefined(1007));

    //Execute standard script.
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
