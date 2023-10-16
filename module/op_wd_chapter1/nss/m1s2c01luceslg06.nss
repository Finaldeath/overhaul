void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M1S2SmallTalk",5);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S2Pass"));
}
