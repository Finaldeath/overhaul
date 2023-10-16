//::///////////////////////////////////////////////
//:: M2Q2D_GIVERING
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Janis takes the ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 12, 2002
//:://////////////////////////////////////////////

void main()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(), "M2Q2ARRING");
    if (GetIsObjectValid(oRing))
    {
        ActionPauseConversation();
        SetPlotFlag(OBJECT_SELF,FALSE);
        ActionTakeItem(oRing,GetPCSpeaker());
        DestroyObject(GetObjectByTag("M2Q2D_SPELL"));
        object oTarget = OBJECT_SELF;
        effect eRingVis = EffectVisualEffect(VFX_IMP_DISPEL_DISJUNCTION);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eRingVis, oTarget);
        ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_COMMONER);
        ActionResumeConversation();
    }
}
