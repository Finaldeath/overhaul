//::///////////////////////////////////////////////
//:: act_mw_curelight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now cures light wounds
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
        ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_LIGHT_WOUNDS_5,
        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_LIGHT",1);
}
