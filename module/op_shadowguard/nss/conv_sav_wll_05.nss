int StartingConditional()
{
    if (WillSave(GetPCSpeaker(), 5, SAVING_THROW_WILL))
        return TRUE;

    return FALSE;
}
