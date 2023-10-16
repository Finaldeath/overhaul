void main()
{
    object oItem = GetInventoryDisturbItem();
    if(GetTag(oItem) != "Q3C_ChargedOrb")
        return;

    object oVis = GetNearestObjectByTag("ElectricEffect");
    if(oVis == OBJECT_INVALID)
        return;

    object oOrigin = GetNearestObjectByTag("LightningOrigin");
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        AssignCommand(oVis, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        ExecuteScript("q3c_lightning_hb", oOrigin);
    }
    else if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        AssignCommand(oVis, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        ExecuteScript("q3c_lightning_hb", oOrigin);
    }
}
