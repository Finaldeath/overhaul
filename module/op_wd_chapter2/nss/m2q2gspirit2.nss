//::///////////////////////////////////////////////
//:: M2Q2GSPIRIT2.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the antidote to the spirit of the woods.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 19, 2002
//:://////////////////////////////////////////////
#include "m2_i0_plot"
#include "nw_i0_plot"

void main()
{
    object oAntidote = GetItemPossessedBy(GetPCSpeaker(), "M2Q2G_ANTIDOTE");
    object oAltar = GetObjectByTag("M2Q2F2_ALTAR");

    ActionPauseConversation();
    if (GetIsObjectValid(oAntidote))
    {
        ActionTakeItem(oAntidote, GetPCSpeaker());
        object oTarget = OBJECT_SELF;
        effect eCureVis = EffectVisualEffect(VFX_IMP_DISPEL_DISJUNCTION);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eCureVis, oTarget);
    }
    SetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT",99);
    SetLocalInt(GetModule(),"NW_M2Q2E_WoodsFreed",10);
    SetLocalInt(oAltar,"NW_L_DaggerReturned",2);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_RESTORATION_GREATER),OBJECT_SELF);
    RewardXP("m2q2_Main",25,GetPCSpeaker());
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,50);
    AdjustReputation(GetPCSpeaker(),GetObjectByTag("M2Q2G_INVISIBLE"),50);
    AdjustReputation(GetPCSpeaker(),GetObjectByTag("M2Q2G_INVISIBLE2"),50);
    AdjustReputation(GetPCSpeaker(),GetObjectByTag("M2Q2EAawill1"),100);
    DestroyObject(GetObjectByTag("M2Q2F2_M2Q2G"));
    DestroyObject(GetObjectByTag("M2Q2F2_Portal"));
    ActionResumeConversation();
}
