int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) &&
               GetGender(GetPCSpeaker()) == GENDER_FEMALE;
    return iResult;
}
