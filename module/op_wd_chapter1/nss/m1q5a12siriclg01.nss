int StartingConditional()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));


    return sAreaTag == "SERPENT_LOWER" || sAreaTag == "TEMPLE_OF_HELM";
}
