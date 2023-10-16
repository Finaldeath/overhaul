//::///////////////////////////////////////////////
//:: Name hx_pc_naked_chk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if PC is naked.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetItemInSlot(INVENTORY_SLOT_CHEST, GetPCSpeaker()) == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
