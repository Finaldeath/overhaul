
void main()
{
    SetLocalInt(GetModule(),"NW_G_M2Q5DealWithChief",20);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"nw_it_mneck010"),GetPCSpeaker());
}
