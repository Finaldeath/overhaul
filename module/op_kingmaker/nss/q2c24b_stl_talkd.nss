//::///////////////////////////////////////////////
//:: Talked to
//:: q2c24b_stl_talkd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that Stiletto has been talked to
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    os_SetTalkedTo();
    object oDungeon = GetObjectByTag("q2ac24a_q2ac24c");
    SetLocked(oDungeon,FALSE);
}
