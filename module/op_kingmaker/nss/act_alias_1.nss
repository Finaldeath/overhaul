//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias told PC about Serah's caves.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////
void main()
{
    object oDoor = GetObjectByTag("q1ab_at_q3ag");
    object oMap = GetObjectByTag("q1ab_mn_serahcave");
    SetMapPinEnabled(oMap,1);
    SetLocked(oDoor,FALSE);
    SetLocalInt(GetFirstPC(),"os_serahcaves",10);
}
