//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that pc saved Hermit.
     Give pc Jar of Honey.
     Give PC 1000 XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    SetLocalInt(GetFirstPC(), "OS_HELPDRUID",99);
    CreateItemOnObject("q1_honey",GetFirstPC());
    GiveXPToCreature(GetFirstPC(),1000);
}
