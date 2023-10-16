int StartingConditional()
{
    if(GetLocalInt(GetModule(), "Scriv_conv_cutscene") == TRUE)
    {
        SetLocalInt(GetModule(), "Scriv_conv_cutscene", FALSE);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
