void main()
{
    if (GetLocalInt(GetModule(),"NW_L_M1Q4Locket") == 10)
    {
        SetLocalInt(GetModule(),"NW_L_M1Q4Locket",20);
        ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04ILocket"),GetPCSpeaker());
    }
}
