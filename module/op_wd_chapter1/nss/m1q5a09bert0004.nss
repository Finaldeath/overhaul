int StartingConditional()
{
    int l_iResult;

    l_iResult =GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1 &&
               GetLocalInt(OBJECT_SELF,"LMarcusDead") >= 1;
    return l_iResult;
}

