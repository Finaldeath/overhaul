//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6HealPriest1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The tortured priest takes a healing potion from
    the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 13, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPotion;
    object oLight = GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION001");
    object oSerious = GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION002");
    object oCritical = GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION003");

    if (GetIsObjectValid(oLight))
    {
        oPotion = oLight;
    }
    else if (GetIsObjectValid(oSerious))
    {
        oPotion = oSerious;
    }
    else if (GetIsObjectValid(oCritical))
    {
        oPotion = oCritical;
    }

    ActionTakeItem(oPotion,GetPCSpeaker());
    // This should be changed to UseItem(oPotion)
    DestroyObject(oPotion);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints() - GetCurrentHitPoints()),OBJECT_SELF);
    DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_HEALING_S),OBJECT_SELF));
}
