// Glendir has the promissary note

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF, "q3_promissary"));
    return iResult;
}
