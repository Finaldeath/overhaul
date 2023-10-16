/////Check if PC already told of snowglobe plot

int StartingConditional()

{

    int l_iResult;

        l_iResult = GetLocalInt(GetPCSpeaker(),"SNOW_TALK_LILLIAN") == 1;

    return l_iResult;

}

