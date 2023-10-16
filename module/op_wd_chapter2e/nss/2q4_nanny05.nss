void main()
{
    SetLocalInt(GetModule(),"Londa_Plot",30);

    CreateItemOnObject("M2Q4A_Child_Toy", GetPCSpeaker());

/*
    object oBear = GetItemPossessedBy(OBJECT_SELF,"M2Q4A_Child_Toy");
    if (GetIsObjectValid(oBear))
    {
        ActionGiveItem(oBear,GetPCSpeaker());
    }
    DestroyObject(OBJECT_SELF);
*/
}
