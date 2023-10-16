//::///////////////////////////////////////////////
//:: Die Roll: Conversation Abort
//:: DieRoll_Abort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player aborts the Die Roll
    conversation, destroy the Dice Bag invisible
    object.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    DestroyObject(OBJECT_SELF);
}
