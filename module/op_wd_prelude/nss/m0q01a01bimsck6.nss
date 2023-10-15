int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 2 ||
           GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 3;
}

