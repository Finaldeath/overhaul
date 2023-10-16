//::///////////////////////////////////////////////
//:: ooc_kai_sleep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the local for Kaidala to start the 'rest' conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oKai = GetNearestObjectByTag("os_hen_kai");
    if(GetIsObjectValid(oKai))
    {
        SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",50);
    }
}
