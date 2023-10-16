//* Take Fixed Sword of Ages and return Blessed Sword of Ages
void main()
{
if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES")))
    {
        object oSword = GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES");

        ActionTakeItem(oSword,GetPCSpeaker());
        DestroyObject(oSword);
        CreateItemOnObject("M3Q3C_SWORDAGES",GetPCSpeaker());
        effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    }
}
