//::///////////////////////////////////////////////
//:: act_mw_criticals
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now does massive critical damage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "x2_inc_itemprop"
void main()
{
    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
    itemproperty iProp =
        ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d6);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_CRITICAL",1);
}
