void main()
{
    object oPlayer = GetPCSpeaker();
    object oWrit = GetItemPossessedBy(oPlayer,"M1S2Letter2");
    DestroyObject(oWrit);
    CreateItemOnObject("M1S2KEY1",oPlayer);
    
}
