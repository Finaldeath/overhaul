int StartingConditional()
{
    int l_iResult;

    l_iResult =GetLocalInt(OBJECT_SELF,"LStaffSold") >= 1 &&
               GetLocalInt(OBJECT_SELF,"LItemsReturned") >= 1;
    return l_iResult;
}

