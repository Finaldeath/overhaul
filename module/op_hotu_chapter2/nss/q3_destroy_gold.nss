// Destroy a  pile of gold if empty

void main()
{
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        if(GetFirstItemInInventory(OBJECT_SELF) == OBJECT_INVALID)
            DestroyObject(OBJECT_SELF);
    }
}
