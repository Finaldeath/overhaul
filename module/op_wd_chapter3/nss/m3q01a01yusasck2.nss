///////Checks if Yusam not yet talked to and PC is druid or ranger

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Yusam_Talk") ==0 &&
              (GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) + GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker())) >=1;
    return iResult;
}


