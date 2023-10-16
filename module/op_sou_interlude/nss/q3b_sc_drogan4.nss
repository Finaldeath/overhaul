// Drogan is casting spells on the portal

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 2;
}
