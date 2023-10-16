//CHecks to make sure none of the other 4 original henchmen is in the party
// when you speak to Sharwyn

int StartingConditional()
{
    int iResult;

    iResult = TRUE;

    if (GetObjectSeen(GetObjectByTag("x2_hen_linu"),OBJECT_SELF))
        iResult ==FALSE;
    if (GetObjectSeen(GetObjectByTag("x2_hen_tomi"),OBJECT_SELF))
        iResult ==FALSE;
    if (GetObjectSeen(GetObjectByTag("x2_hen_daelen"),OBJECT_SELF))
        iResult ==FALSE;

    return iResult;
}


