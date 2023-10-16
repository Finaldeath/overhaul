// if Musharak has agreed to Jasmeena's deal
// and has not received wine from elsewhere

int StartingConditional()
{
    int Plot1 = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status");
    int Plot2 = GetLocalInt(GetModule(), "q5a_Musharak_Wine");

    if ((Plot1 == 4) && (Plot2 < 8))
    {
        return TRUE;
    }
    return FALSE;
}
