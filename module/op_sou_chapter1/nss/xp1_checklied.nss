// The PC only gets to try the 'secret agent' story once.

int StartingConditional()
{

    return(!GetLocalInt(GetPCSpeaker(), "LiedToGretti"));
}
