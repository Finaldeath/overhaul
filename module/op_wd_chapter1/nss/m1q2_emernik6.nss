int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF, "TalkedTo");
    if (bCondition) SetLocalInt(OBJECT_SELF, "TalkedTo", TRUE);
    return bCondition;
}

