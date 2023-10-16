//::///////////////////////////////////////////////
//:: Name q5_ent_bouldtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter, set variable that PC has seen the giant
    boulder
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 24/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
        SetLocalInt(oPC, "X1_Q5PCKnowBoulder", 1);
}
