// the PC has Tymofarrar's head

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q5_Tymo_Head"));
    return iResult;
}
