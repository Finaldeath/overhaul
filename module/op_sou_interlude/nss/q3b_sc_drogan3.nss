// when the player enters the room after activating the portal

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 3;
}
