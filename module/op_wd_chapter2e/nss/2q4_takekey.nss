void main()
{
    object oKey = GetItemPossessedBy(GetLastOpenedBy(), "2q4e_CryptDoor");

    if(GetIsObjectValid(oKey))
    {
        DestroyObject(oKey);
    }
}
