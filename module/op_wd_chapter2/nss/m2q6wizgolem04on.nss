//::///////////////////////////////////////////////
//:: Used
//:: m2q6WizGolem04On
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The golem is activated.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oUser = GetLastUsedBy();
    object oPC = GetNearestPC();
    object oGolem = GetObjectByTag("M2Q06CWIZGOLEM04");

    if (GetLocalInt(oGolem,"NW_L_Activated") < 10)
    {
        if (GetIsPC(oUser))
        {
            SetLocalInt(oGolem,"NW_L_Activated",10);
            AdjustReputation(oUser,oGolem,100);
        }
        else
        {
            SetLocalInt(oGolem,"NW_L_Activated",5);
            AdjustReputation(oPC,oGolem,-100);
        }
        SignalEvent(oGolem,EventUserDefined(600));
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_S),oGolem);
    }
}
