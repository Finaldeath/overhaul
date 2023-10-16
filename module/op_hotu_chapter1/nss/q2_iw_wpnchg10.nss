// if the sword is changing into something other than a longsword

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "IW_WPNCHG") > 1;
    return iResult;
}
