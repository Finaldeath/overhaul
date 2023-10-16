//::///////////////////////////////////////////////
//:: Name hx_areaexit_ring
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will make sure ring variables are set
     since the ring doesnt work in this area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 3, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    object oRing = GetItemPossessedBy(oPC, "hx_puzzle_ring");
    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

    if(GetIsObjectValid(oRing))
    {
        if(oRing == oLeft || oRing == oRight)
        {
            SetLocalInt(GetModule(), "PCHasHellRingOn", 1);
        }
        else
        {
            SetLocalInt(GetModule(), "PCHasHellRingOn", 0);
        }
    }
}
