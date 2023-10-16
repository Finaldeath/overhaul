//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark PC is on Southpaw's quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////
void main()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    SetLocalInt(GetFirstPC(),"os_freeprisoner",10);
    SetLocalInt(oEnivid,"OS_ENIVID_STILETTO",10);
}
