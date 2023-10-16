//::///////////////////////////////////////////////
//:: Name act_q1hblake_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Use a healing kit on Walther
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();

    effect eEffect = GetFirstEffect(oBlake);
    DelayCommand(2.0, RemoveEffect(oBlake, eEffect));
    SetLocalInt(oBlake, "nCured", 1);
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 1.5));

    object oItem;
    int nStackSize;
    effect eHeal;
    effect eVfx = EffectVisualEffect(VFX_IMP_HEAD_HEAL);
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "NW_IT_MEDKIT001")) == TRUE)
    {
        oItem = GetItemPossessedBy(oPC, "NW_IT_MEDKIT001");
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
    }
    else
    {
        oItem = GetItemPossessedBy(oPC, "NW_IT_MEDKIT002");
        nStackSize = GetNumStackedItems(oItem);
        if (nStackSize > 1)
        {
            SetItemStackSize(oItem, nStackSize - 1);
        }
        else
        {
            DestroyObject(oItem);
        }
        eHeal = EffectHeal(20);
    }
    effect eLink = EffectLinkEffects(eVfx, eHeal);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oBlake));
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);


    DelayCommand(2.75, ActionResumeConversation());
}
