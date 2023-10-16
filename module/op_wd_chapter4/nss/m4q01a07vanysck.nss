//////Check if she Vanya has master, check if PC has agreed to do job

int StartingConditional()
{
    if(!GetIsObjectValid(GetMaster()) && GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALK_TRANCAR") ==3)
    {
        return TRUE;
    }
    return FALSE;
}

