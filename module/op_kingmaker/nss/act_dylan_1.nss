//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC gets hero's rate at Inn
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
void main()
{
    object oMossy = GetObjectByTag("q2_mrmossy");
    SetLocalInt(oMossy,"OS_HERORATE",10);
}