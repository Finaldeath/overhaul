void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    ExploreAreaForPlayer(OBJECT_SELF, oPC);
}
