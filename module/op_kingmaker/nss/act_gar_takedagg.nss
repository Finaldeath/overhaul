//::///////////////////////////////////////////////
//:: Takes Dagger
//:: act_gar_takedagg
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
//  take dagger, give q2_yawning boots, some xp
    object oPC = GetFirstPC();
    os_DestroyItem("q1_poisondagger");
    CreateItemOnObject("q2_yawning",oPC);
    GiveXPToCreature(oPC,250);
    SetLocalInt(OBJECT_SELF,"OS_GARROT_HELPED",10);
}
