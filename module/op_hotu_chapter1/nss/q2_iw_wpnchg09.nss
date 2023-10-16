// the player has been told about the sword's ability to change
// and the sword is not going to change into a greatsword
int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetModule(), "IW_WPNCHG") > 0) &&
               (GetLocalInt(GetModule(), "IW_WPNCHG") != 4));
    return iResult;
}
