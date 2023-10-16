//::///////////////////////////////////////////////
//:: Adjust 1 point to chaotic good
//:: x0_d1_didcgtny
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////
/*
    Used in conversation to adjust the PC's alignment
    toward chaotic good 1 point on each axis.
*/
//:://////////////////////////////////////////////
//:: Created By: Nathaniel Blumberg
//:: Created On: 10/12/02 @ 16:25
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    AdjustAlignment( oPC, ALIGNMENT_CHAOTIC, 1 );
    AdjustAlignment( oPC, ALIGNMENT_GOOD, 1 );

    ActionPauseConversation();

    AssignCommand(oPC, ActionMoveToObject(OBJECT_SELF));
    DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0)));
    object oItem = GetLocalObject(OBJECT_SELF, "POTION");
    int nStackSize;
    effect eHeal;
    effect eVfx = EffectVisualEffect(VFX_IMP_HEAD_HEAL);
    nStackSize = GetNumStackedItems(oItem);
    if (nStackSize > 1)
    {
        SetItemStackSize(oItem, nStackSize - 1);
    }
    else
    {
        DestroyObject(oItem);
    }
    eHeal = EffectHeal(8);


    effect eLink = EffectLinkEffects(eVfx, eHeal);
    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, OBJECT_SELF));
    DelayCommand(4.0, ActionResumeConversation());
}
