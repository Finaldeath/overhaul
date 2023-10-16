//::///////////////////////////////////////////////
//:: act_mw_curepoiso
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now cures poison
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
        ItemPropertyCastSpell(IP_CONST_CASTSPELL_NEUTRALIZE_POISON_5,
        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_CUREPOISON",1);
}
