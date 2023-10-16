//::///////////////////////////////////////////////
//:: Name act_q1hblake_8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    //Give Gem to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();


    SetLocalInt(oBlake, "nCured", 1);
    DestroyObject(GetItemPossessedBy(oBlake,"NW_IT_GEM003"));
    CreateItemOnObject("nw_it_gem003", oPC);
    SetLocalInt(GetModule(), "X1_Q1HBLAKEGEM", 2);
}
