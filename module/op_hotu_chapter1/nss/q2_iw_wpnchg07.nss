// the player has been told about the sword's ability to change
// and the sword is not going to change into a short sword

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetModule(), "IW_WPNCHG") > 0) &&
               (GetLocalInt(GetModule(), "IW_WPNCHG") != 3));
    return iResult;
}
