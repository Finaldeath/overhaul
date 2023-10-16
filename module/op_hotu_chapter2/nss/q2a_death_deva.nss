//::///////////////////////////////////////////////
//:: Name q2a_death_deva
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnDeath script for the Deva during the siege
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    SetLocalInt(GetModule(), "bDevaDead", 1);
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
