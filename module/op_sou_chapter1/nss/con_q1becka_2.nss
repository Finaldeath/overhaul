int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_RUMGUTDEAD")== 1 && GetLocalInt(GetModule(), "X1_Q1RuralRebPoison") == 2 && GetTag(GetArea(OBJECT_SELF)) == "q1krumgut" && GetLocalInt(OBJECT_SELF, "nComplainedToPC") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nComplainedToPC", 1);
        return TRUE;
    }
    return FALSE;
}
