// The golem creation table. Placing component in the inventoray may create a golem related item:
// There must be the exact number of components an no other items:
// 1. Golem Crasher: Mithril Statue + 2 blue powders.
// 2. Golem Binder: Golden Rod + Yellow powder + blue poweder
// 3. Golem Attractor: Magical Crystal + Red poweder + blue powder.

int HasCrasherItems()
{
    if(GetItemPossessedBy(OBJECT_SELF, "q4b_comp6") != OBJECT_INVALID)
    {
        int nBlueCount = 0;
        object oItem = GetFirstItemInInventory();
        while(oItem != OBJECT_INVALID)
        {
            if(GetTag(oItem) == "q4b_comp1")
                nBlueCount++;
            oItem = GetNextItemInInventory();
        }
        if(nBlueCount == 2)
            return TRUE;
        return FALSE;
    }
    return FALSE;
}

int HasBinderItems()
{
    if(GetItemPossessedBy(OBJECT_SELF, "q4b_comp5") != OBJECT_INVALID &&
       GetItemPossessedBy(OBJECT_SELF, "q4b_comp3") != OBJECT_INVALID &&
       GetItemPossessedBy(OBJECT_SELF, "q4b_comp1") != OBJECT_INVALID)
            return TRUE;

    return FALSE;
}

int HasAttractorItems()
{
    if(GetItemPossessedBy(OBJECT_SELF, "q4b_comp4") != OBJECT_INVALID &&
       GetItemPossessedBy(OBJECT_SELF, "q4b_comp2") != OBJECT_INVALID &&
       GetItemPossessedBy(OBJECT_SELF, "q4b_comp1") != OBJECT_INVALID)
            return TRUE;
    return FALSE;
}

void ClearInventory()
{
    effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    object oItem = GetFirstItemInInventory();
    while(oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory();
    }
}

int GetItemsNum()
{
    int nCount = 0;
    object oItem = GetFirstItemInInventory();
    while(oItem != OBJECT_INVALID)
    {
        nCount++;
        oItem = GetNextItemInInventory();
    }
    return nCount;
}

void Create(string sTag)
{
    CreateItemOnObject(sTag);
}

void main()
{
    // Each time an inventory is disturbed checking for a possible combo:
    if(GetItemsNum() != 3)
        return; // no need to check anything if there are more or less than 3 items
    if(HasCrasherItems())
    {
        ClearInventory();
        DelayCommand(0.2, Create("q4b_crasher"));
    }
    else if(HasBinderItems())
    {
        ClearInventory();
        DelayCommand(0.2, Create("q4b_binder"));
    }
    else if(HasAttractorItems())
    {
        ClearInventory();
        DelayCommand(0.2, Create("golemattractor"));
    }
}
