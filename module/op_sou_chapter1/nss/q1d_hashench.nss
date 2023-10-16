// checks to see if the PC has a henchman

int StartingConditional()
{
    int iResult;

    iResult = (GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetPCSpeaker())));
    return iResult;
}
