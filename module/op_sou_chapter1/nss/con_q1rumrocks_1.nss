int StartingConditional()
{
    object oRebecca = GetObjectByTag("q1ruralrebecca");

    if (GetLocalInt(GetPCSpeaker(), "X1_RumgutSecret") != 1 && (GetTag(GetArea(oRebecca)) == "q1krumgut"))
        return TRUE;
    return FALSE;
}
