// Explores area for player

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());
}
