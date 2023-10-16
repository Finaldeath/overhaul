//::///////////////////////////////////////////////
//:: Aribeth (OnDamage)
//:: H2_Dmg_Aribeth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fire the OnDamage UD event to accommodate her
     surrender.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

void main()
{
    //If she has not surrendered yet...
    int bSurrendered = GetLocalInt(OBJECT_SELF, "Generic_Surrender");
    if (bSurrendered == FALSE)
    {
        //Signal her User-Defined OnDamage event to check for surrender.
        SignalEvent(OBJECT_SELF, EventUserDefined(1006));
    }

    //Execute as normal.
    ExecuteScript("nw_ch_ac6", OBJECT_SELF);
}
