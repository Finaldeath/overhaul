// Drogan didn't finish talking to the players

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "q5_Drogan_Tells_Plan") == 1;
}
