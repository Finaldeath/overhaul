//::///////////////////////////////////////////////
//:: Name ten_eh_dwclear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroy the trigger if the related plot has been
     resolved.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: July 2004
//:://////////////////////////////////////////////

void main()
{
    // Plot completed?
    int iCheck = GetLocalInt(GetModule(), "OS_THEGORD_DWARF") > 20;

    if (iCheck == TRUE)
    {
        DestroyObject(OBJECT_SELF);
    }
}
