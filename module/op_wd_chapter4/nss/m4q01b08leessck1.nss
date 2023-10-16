int StartingConditional()
{
    int iResult;

///////////  She is following someone back to Moonstone Mask
     iResult = GetPCSpeaker() == GetLocalObject(GetModule(), "NW_G_M4Q01PLOTLEESA_SAVIOUR");
    return iResult;
}
