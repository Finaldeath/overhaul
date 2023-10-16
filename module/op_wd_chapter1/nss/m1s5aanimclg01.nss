int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_M1S5TreeActive") &&
           GetTag(GetArea(OBJECT_SELF)) != "Map_M1S5B";
}
