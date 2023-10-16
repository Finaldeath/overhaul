//::///////////////////////////////////////////////
//:: Name act_q6man_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give Dying Man a healing potion - which he
    will drink and be cured.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oMan = GetObjectByTag("dyingman");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();

    AssignCommand(oPC, ActionMoveToObject(oMan));
    DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.0)));
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


    DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oMan));
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);

    effect eEffect = GetFirstEffect(oMan);
    DelayCommand(5.0, RemoveEffect(oMan, eEffect));

    SetLocalInt(oMan, "nCured", 1);
    DelayCommand(4.5, ActionResumeConversation());





}
