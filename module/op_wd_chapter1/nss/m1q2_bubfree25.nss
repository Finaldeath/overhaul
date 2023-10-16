int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "SetFree") &&
           GetIsObjectValid(GetPCSpeaker()) == FALSE;
}

