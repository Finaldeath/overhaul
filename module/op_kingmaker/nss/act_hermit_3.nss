//::///////////////////////////////////////////////
//:: act_hermit_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give PC 300 XP.
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
    GiveXPToCreature(GetFirstPC(),300);
}
