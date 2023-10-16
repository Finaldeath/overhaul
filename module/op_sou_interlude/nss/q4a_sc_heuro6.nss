// talking to petrified player

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") >= 1;
}
