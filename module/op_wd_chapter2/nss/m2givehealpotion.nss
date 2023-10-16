//::///////////////////////////////////////////////
//:: Conversation
//:: m2givehealpotion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 25, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    int nSpell;

    object oPotion;
    object oPC = GetPCSpeaker();

    ActionPauseConversation();
    if (HasItem(oPC,"NW_IT_MPOTION001"))
    {
        oPotion = GetItemPossessedBy(oPC,"NW_IT_MPOTION001");
        nSpell = SPELL_CURE_LIGHT_WOUNDS;
    }
    else if (HasItem(oPC,"NW_IT_MPOTION002"))
    {
        oPotion = GetItemPossessedBy(oPC,"NW_IT_MPOTION002");
        nSpell = SPELL_CURE_SERIOUS_WOUNDS;
    }
    else if (HasItem(oPC,"NW_IT_MPOTION003"))
    {
        oPotion = GetItemPossessedBy(oPC,"NW_IT_MPOTION003");
        nSpell = SPELL_CURE_CRITICAL_WOUNDS;
    }
    else if (HasItem(oPC,"NW_IT_MPOTION020"))
    {
        oPotion = GetItemPossessedBy(oPC,"NW_IT_MPOTION020");
        nSpell = SPELL_CURE_MODERATE_WOUNDS;
    }

    if (GetIsObjectValid(oPotion))
    {
        ActionTakeItem(oPotion,oPC);
        ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
        ActionCastSpellAtObject(nSpell,OBJECT_SELF,METAMAGIC_NONE,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    ActionResumeConversation();
}
