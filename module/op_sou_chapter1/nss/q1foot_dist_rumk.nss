//q1foot_dist_rumk
void main()
{
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        object oKey = GetInventoryDisturbItem();
        if (GetTag(oKey) == "q1rumgutkey")
        {
            SetLocalInt(OBJECT_SELF, "nKeyTaken", 1);

        }
    }
}
