//::///////////////////////////////////////////////
//:: Name ten_eh_mnclear
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
    int iCheck = GetLocalInt(GetModule(), "os_manticorehunt") > 15;

    if (iCheck == TRUE)
    {
        DestroyObject(OBJECT_SELF);
    }
}
