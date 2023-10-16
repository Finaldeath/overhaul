int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_ItemASold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_ItemBSold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_ItemCSold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_ItemXSold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_ItemYSold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_ItemZSold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_Item1Sold") == TRUE &&
              GetLocalInt(OBJECT_SELF,"NW_L_Item2Sold") == TRUE;
    return iResult;
}
