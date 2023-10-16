//::///////////////////////////////////////////////
//:: Ellysia Loves Feran
//:: act_ell_feranlov
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ellysia loves Feran
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//set happy greeting, give xp, set Ellysia loves Feran
    object oPC = GetFirstPC();
    SetLocalInt(GetModule(), "OS_FERANLOVE",20);
    GiveXPToCreature(oPC,500);
    SetLocalInt(GetFirstPC(), "OS_ELLYSIA_MOOD",20);
}
