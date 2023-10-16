// revived oasis should be explored

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    ExploreAreaForPlayer(OBJECT_SELF, oPC);


}
