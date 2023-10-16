//CHecks to make sure neither Daelen nor Sharwyn is in the party
// when you speak to Linu

int StartingConditional()
{
    int iResult;

    iResult = TRUE;

    if (GetObjectSeen(GetObjectByTag("x2_hen_daelen"),OBJECT_SELF))
        iResult ==FALSE;
    if (GetObjectSeen(GetObjectByTag("x2_hen_sharwyn"),OBJECT_SELF))
        iResult ==FALSE;

    return iResult;
}

