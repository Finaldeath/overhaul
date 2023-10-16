//::///////////////////////////////////////////////
//:: Name act_q2amaekey
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Maeviir Daughter gives PC the 'mcguffin' to
    get into House maeviir
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 22/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nGiveKey") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nGiveKey", 1);
    object oPC = GetPCSpeaker();
    CreateItemOnObject("", oPC);
}
