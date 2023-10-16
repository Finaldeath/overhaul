//::///////////////////////////////////////////////
//:: m2q2H Guardian Spirit Action Script #12
//:: m2q3H_GuardiaA12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the player the phylactery.

    Sets the module local to indicate that the
    Player has the phylactery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
//    object oPhylactery = GetObjectByTag("M2Q3_PHYLACTERY");
    object oModule = GetModule();

//    ActionGiveItem(oPhylactery, oPC);
    CreateItemOnObject("M2Q3_PHYLACTERY", oPC);
    SetLocalString(oModule, "m2q3_Resolution", "Player");
    SetLocalInt(OBJECT_SELF,"NW_L_JudgementMade",1);
}
