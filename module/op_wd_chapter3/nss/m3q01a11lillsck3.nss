/////Check if PC already talked to and not told of snowglobe plot


int StartingConditional()

{

    int l_iResult;

        l_iResult = GetLocalInt(GetPCSpeaker(),"SNOW_TALK_LILLIAN") == 0 &&
                    GetLocalInt(GetPCSpeaker(),"Lillian_Talk") ==1;

    return l_iResult;

}


