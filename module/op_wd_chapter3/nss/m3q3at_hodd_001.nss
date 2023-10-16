//* Take Broken Sword of Ages and return Fixed Sword of Ages
void main()
{
if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES")))
    {
        object oSword = GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES");

        ActionTakeItem(oSword,GetPCSpeaker());
        DestroyObject(oSword);
        CreateItemOnObject("M3Q3C_FIXEDAGES",GetPCSpeaker());
        PlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
        effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);

    }
}

