//::///////////////////////////////////////////////
//:: Witchworks Sit Script
//:: WW_Sit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Place this on the on-use event of any
    placeable that you want the player to be able
    to sit on.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oSeat = OBJECT_SELF;

    if(!GetIsObjectValid(GetSittingCreature(oSeat)))
    {
        AssignCommand(oPC, ActionSit(oSeat));
    }
}
