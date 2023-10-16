int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) &&
               GetGender(GetPCSpeaker()) == GENDER_MALE;
    return iResult;
}
