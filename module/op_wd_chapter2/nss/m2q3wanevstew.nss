void main()
{
    int nFound = 0;
    object oReagent1 = OBJECT_INVALID;
    object oReagent2 = OBJECT_INVALID;
    object oReagent3 = OBJECT_INVALID;
    object oReagent4 = OBJECT_INVALID;
    object oPortal = GetObjectByTag("WP_WANEVDENEXIT");
    object oItem = GetFirstItemInInventory();

    location lPortal = GetLocation(oPortal);

    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_WanevPortalOn") == 0)
    {
        while (nFound == 0 && GetIsObjectValid(oItem))
        {
            if (GetTag(oItem) == "NW_IT_MSMLMISC08")
            {
                oReagent1 = oItem;
            }
            else if (GetTag(oItem) == "NW_IT_MSMLMISC13")
            {
                if (!GetIsObjectValid(oReagent2))
                {
                    oReagent2 = oItem;
                }
                else if (!GetIsObjectValid(oReagent3))
                {
                    oReagent3 = oItem;
                }
            }
            else if (GetTag(oItem) == "NW_IT_MSMLMISC10")
            {
                oReagent4 = oItem;
            }
            if (GetIsObjectValid(oReagent1) &&
                GetIsObjectValid(oReagent2) &&
                GetIsObjectValid(oReagent3) &&
                GetIsObjectValid(oReagent4))
            {
                nFound = 1;
            }

            oItem = GetNextItemInInventory();
        }
        if (nFound == 1)
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_A_WanevPortalOn",10);

            DestroyObject(oReagent1);
            DestroyObject(oReagent2);
            DestroyObject(oReagent3);
            DestroyObject(oReagent4);

            CreateObject(OBJECT_TYPE_PLACEABLE,"M2Q3PWANEVENTER",GetLocation(oPortal));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_POISON_S),OBJECT_SELF,2.0);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_HEALING_L),lPortal);
        }
    }
}
