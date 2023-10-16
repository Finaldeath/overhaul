// * returns true if player has the original love amulet from c2
int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET")) ;
    return iResult;
}
