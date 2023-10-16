// the PC has the Rod of Rule

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q5rodofrule"));
    return iResult;
}
