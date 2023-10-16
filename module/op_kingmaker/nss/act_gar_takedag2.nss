//::///////////////////////////////////////////////
//:: Takes Dagger
//:: act_gar_takedag2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Garrot takes the dagger from the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//  if pc is ambushed by Sir Becket's assassins, Garrot will show up to help the PC.,
//take dagger, give some xp, alignment shift lawful

    object oPC = GetFirstPC();
    os_DestroyItem("q1_poisondagger");
    GiveXPToCreature(oPC,250);
    AdjustAlignment(oPC,ALIGNMENT_LAWFUL,15);
    SetLocalInt(OBJECT_SELF,"OS_GARROT_HELPED",20);
}
