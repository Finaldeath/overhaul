//::///////////////////////////////////////////////
//:: Name ten_eh_udclear
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
    int iCheck = GetLocalInt(GetModule(), "OS_THEGORD_ARCH") > 20;

    if (iCheck == TRUE)
    {
        DestroyObject(OBJECT_SELF);
    }
}
