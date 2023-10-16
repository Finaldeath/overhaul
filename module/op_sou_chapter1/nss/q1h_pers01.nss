// the herbalist has not already been bilked out of gold

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1h_bilked") == 0;
    return iResult;
}
