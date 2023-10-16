void main()
{
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        object oItem = GetFirstItemInInventory();
        while (oItem != OBJECT_INVALID)
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory();
        }
        DelayCommand(0.1, DestroyObject(OBJECT_SELF));
    }
    /*if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        object oDisturb = GetInventoryDisturbItem();
        DestroyObject(oDisturb);
    } */

}
