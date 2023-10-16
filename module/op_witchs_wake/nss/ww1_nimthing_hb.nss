//::///////////////////////////////////////////////
//:: Witch's Wake 1: Nimmermaer's Thingy, Heartbeat
//:: WW1_NimThing_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the ambient thingy to repetitively
     play its Activate and Deactivate animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2004
//:://////////////////////////////////////////////

void main()
{
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    DelayCommand(3.0, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
}
