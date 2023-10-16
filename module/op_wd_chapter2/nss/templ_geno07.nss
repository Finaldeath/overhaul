void main()
{
    object oHead = GetItemPossessedBy(GetPCSpeaker(),"GENO_ITEM01");
    ActionTakeItem(oHead, GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_GENO_PLOT",1);
}
