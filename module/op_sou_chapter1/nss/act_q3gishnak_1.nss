//Gishnak gives PC his key
void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "Q3_KEY_CHIEF");
    object oPC = GetPCSpeaker();
    // first - handle the chief

    if(oKey != OBJECT_INVALID)
        ActionGiveItem(oKey, oPC);

}
