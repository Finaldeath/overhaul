// 1/3 chance of returning true - for random conversations
int StartingConditional()
{
    if (Random(3) + 1 == 3)
        return TRUE;
    return FALSE;
}
