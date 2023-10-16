//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that pc will help hermit.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept., 2003
//:://////////////////////////////////////////////
void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oHive1 = GetObjectByTag("q1_poisonhive");
    object oHive2 = GetObjectByTag("q1_beehive1",0);
    object oHive3 = GetObjectByTag("q1_beehive1",1);
    object oHive4 = GetObjectByTag("q1_beehive1",2);
    SetLocalInt(GetFirstPC(), "OS_HELPDRUID",15);
    SetLocked(oHive1,FALSE);
    SetLocked(oHive2,FALSE);
    SetLocked(oHive3,FALSE);
    SetLocked(oHive4,FALSE);
}
