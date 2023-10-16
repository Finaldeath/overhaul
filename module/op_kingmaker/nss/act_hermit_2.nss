//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that pc paid by Hermit.
     Give pc 100 gold.
     Give PC 200 XP.
     Give PC quest to get help for Hermit.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    SetLocalInt(GetFirstPC(), "OS_HELPDRUID",30);
    SetLocalInt(GetModule(), "OS_DRUIDPAID",10);
    GiveGoldToCreature(GetFirstPC(),100);
    GiveXPToCreature(GetFirstPC(),200);
}
