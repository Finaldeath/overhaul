// Katriana starting conditional: Zidan is missing

int StartingConditional()
{
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    if(oZidan == OBJECT_INVALID || GetArea(oZidan) != GetArea(OBJECT_SELF))
        return TRUE;
    return FALSE;
}
