void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S1Plot",100);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"nw_it_mneck026"),GetPCSpeaker());
    DestroyObject(GetObjectByTag("M1S1ABriley"));
}
