// if Katriana has not seen the cards yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1i_Katriana_Seen_Cards") == 0;
    return iResult;
}
