// check if the pc was told to leave by Nilmaldor.


int StartingConditional()
{
    return (GetLocalInt(GetPCSpeaker(),"Q2_NIL_MAD") == 10);
}
