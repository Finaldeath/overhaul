//::///////////////////////////////////////////////
//:: act_leviosa_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that Levio'Sa has told the PC about
     the Manticore.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept.3, 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oMap = GetObjectByTag("q3_map_manticore");
    int iDoOnce = GetLocalInt(OBJECT_SELF, "act_leviosa_2");

    if (iDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "act_leviosa_2", TRUE);

        CreateItemOnObject("key_manticore", GetFirstPC());

        SetMapPinEnabled(oMap,1);
        SetLocalInt(GetModule(), "os_manticorehunt",10);
    }
}
