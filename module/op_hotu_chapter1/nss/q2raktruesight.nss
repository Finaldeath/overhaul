//::///////////////////////////////////////////////
//:: Name q2raktruesight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make sure Rakshasa transform if True Sight is cast
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 25/03
//:://////////////////////////////////////////////
#include "x2_inc_switches"
void main()
{
    //Check for truesight
    int nSpell = GetSpellId();
    if (nSpell != SPELL_TRUE_SEEING)
        return;

    //Check for PC (or item)
    object oPC = OBJECT_SELF;
    if (GetObjectType(oPC) == OBJECT_TYPE_CREATURE)
    {
        if (GetIsPC(oPC) == FALSE)
            return;
    }

    //Check for Area
    object oArea = GetArea(oPC);
    if (GetTag(oArea) != "q2c_um2east")
        return;

    //Make sure PC was in the back half of the area when casting
    object oTriggerArea = GetObjectByTag("q2ctrg_truesight");
    if (GetIsInSubArea(oPC, oTriggerArea) == FALSE)
        return;


    //if true sight was cast in the Rakshasa area
    //transform the rakshasa and revert the spell override script
    SetModuleOverrideSpellscript("");

    ExecuteScript("act_q2rakattack", oArea);


}
