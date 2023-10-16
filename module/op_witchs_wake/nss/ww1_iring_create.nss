//::///////////////////////////////////////////////
//:: Witch Wake 1: Iron Ring, Create Portrait Holder
//:: WW1_IRing_Create.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns in a placeable with the appropriate
     portrait for the ring whisper.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    location lSelf = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, "ww1_ironring", lSelf);
}
