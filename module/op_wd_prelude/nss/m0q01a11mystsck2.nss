int StartingConditional()
{
    //* Should spawn Goblins in once
    return GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") <= 1;
}

