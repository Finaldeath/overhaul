//If a PC destroys the chest - they get nothing..
void main()
{
    if(GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        object oItem1 = GetFirstItemInInventory();
        object oItem2 = GetNextItemInInventory();
        object oItem3 = GetNextItemInInventory();
        DestroyObject(oItem1);
        DestroyObject(oItem2);
        DestroyObject(oItem3);
        DelayCommand(0.1, DestroyObject(OBJECT_SELF));
    }

}
