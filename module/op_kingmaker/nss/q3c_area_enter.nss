//::///////////////////////////////////////////////
//:: Area Enter
//:: q3c_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC enters the dwarven hall
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        os_SetAreaEntered();
        object oSpell = GetObjectByTag("q3_duerspell");
        if(GetIsObjectValid(oSpell))
        {
            event eFire = EventUserDefined(305);//summons a fire elemental
            SignalEvent(oSpell,eFire);
        }
    }
}
