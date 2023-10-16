// Tymofarrar has not already given the Mask
// and the PC does not know he has the mask

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(OBJECT_SELF, "q5_Gave_Mask") == 0) &&
               (GetLocalInt(GetPCSpeaker(), "q5_Know_Tymo_Mask") == 0));
    return iResult;
}
