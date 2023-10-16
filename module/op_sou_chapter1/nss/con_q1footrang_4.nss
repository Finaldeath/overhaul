int StartingConditional()
{
    object oHeart = GetItemPossessedBy(GetPCSpeaker(), "q1footstagtrophy");
    if (GetIsObjectValid(oHeart) == TRUE)
        return TRUE;
    return FALSE;
}
