//::///////////////////////////////////////////////
//:: Name act_q1hblake_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give Walther a healing potion - which he
    will drink and be cured.
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
   // effect eEffect = GetFirstEffect(oBlake);
    //RemoveEffect(oBlake, eEffect);

    object oItem;
    int nStackSize;
    effect eHeal;
    effect eVfx = EffectVisualEffect(VFX_IMP_HEAD_HEAL);
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "NW_IT_MPOTION001")) == TRUE)
    {
        oItem = GetItemPossessedBy(oPC, "NW_IT_MPOTION001");
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
        oItem = GetItemPossessedBy(oPC, "NW_IT_MPOTION020");
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


    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oBlake));
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);

    SetLocalInt(oBlake, "nCured", 1);
    DelayCommand(2.75, ActionResumeConversation());

}
