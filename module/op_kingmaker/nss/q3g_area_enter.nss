//::///////////////////////////////////////////////
//:: Area Enter
//:: q3g_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC enters Serah's caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    if((GetIsPC(GetEnteringObject()) == TRUE) && (os_CheckAreaEntered() == TRUE))
    {
        DoSinglePlayerAutoSave();
        os_SetAreaEntered();
        SetLocalInt(OBJECT_SELF,"OS_AREA_ENTER",10);

        object oShaman = GetObjectByTag("q3_goblinshaman");

        if(GetIsObjectValid(oShaman))
        {
            event eHeal = EventUserDefined(302);//sets the shaman to healing the goblins
            SignalEvent(oShaman,eHeal);
        }
    }
}
