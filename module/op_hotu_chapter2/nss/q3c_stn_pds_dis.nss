void main()
{
    object oItem = GetInventoryDisturbItem();
    if(GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_ADDED)
        return;
    if(GetTag(oItem) == "Q3_StrangeStone")
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        SetLocalInt(GetArea(OBJECT_SELF), "PORTAL_ENABLED", 1);
        int i;
        object oBlock;
        for(i = 1; i <= 7; i++)
        {
            effect eBlow = EffectVisualEffect(VFX_IMP_MAGBLUE);
            oBlock = GetNearestObjectByTag("Q3C_SPARKS", OBJECT_SELF, i);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlow, oBlock);
            SetPlotFlag(oBlock, FALSE);
            DestroyObject(oBlock);
        }

    }
}
