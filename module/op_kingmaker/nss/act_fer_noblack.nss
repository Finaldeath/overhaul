//::///////////////////////////////////////////////
//:: Feran Won't be Blackmailed
//:: act_fer_noblack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran refuses to be blackmailed
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//Chaotic hit, less xp.
    object oPC = GetFirstPC();
    GiveXPToCreature(oPC,500);
    AdjustAlignment(oPC,ALIGNMENT_CHAOTIC,15);
}
