//::///////////////////////////////////////////////
//:: Githzerai Sensei, Custom OnSpawn
//:: H2_Sp_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Custom OnSpawn script to fire the UD event
     that handles his sleep / meditation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

#include "x0_i0_anims"
void main()
{
    //Fire the UD Event to handle her sleep / meditation.
    DelayCommand(5.0, SignalEvent(OBJECT_SELF, EventUserDefined(1050)));

    ExecuteScript("nw_c2_default9", OBJECT_SELF);
    SetIsDestroyable(FALSE, FALSE, FALSE);
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);

}
