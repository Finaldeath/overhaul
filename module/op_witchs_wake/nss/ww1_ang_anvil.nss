//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar, Bash Anvil
//:: WW1_Ang_Anvil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes Angmar to bash his anvil.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 28, 2004
//:://////////////////////////////////////////////

void main()
{
    //Signal Bash event
    DelayCommand(2.0, SignalEvent(OBJECT_SELF, EventUserDefined(2001)));
}
